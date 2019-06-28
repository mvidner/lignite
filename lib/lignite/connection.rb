# typed: true
module Lignite
  # The communication channel to the robot.
  # The callers use {#send} and {#receive}.
  # Subclasses implement {#read}, {#write} and {#close}.
  class Connection
    include Bytes
    include Logger
    extend Logger

    # @return [Connection] Try a {Usb} connection first, then a {Bluetooth} one.
    def self.create
      @c ||= Replay.new(ENV["LIGNITE_REPLAY"]) if ENV["LIGNITE_REPLAY"]

      @c ||= begin
               logger.debug "Connection: trying USB"
               Usb.new
             rescue NoUsbDevice
               logger.debug "Connection: trying BT"
               Bluetooth.new
             end

      @c = Tap.new(@c, ENV["LIGNITE_TAP"]) if ENV["LIGNITE_TAP"]
      logger.debug "Connection: #{@c.inspect}"
      @c
    end

    def self.reset
      @c = nil
    end

    def initialize
      @buf = ""
    end

    # @!group Subclasses must implement

    # @!method read(maxlen)
    #   @param maxlen [Integer]
    def read(_maxlen)
      raise NotImplementedError
    end

    # @!method write(data)
    #   @param data [ByteString]
    def write(_data)
      raise NotImplementedError
    end

    # @!endgroup

    def close
      Connection.reset
    end

    # @param payload [ByteString]
    def send(payload)
      packet = u16(payload.bytesize) + payload
      logger.debug "-> #{packet.inspect}"

      write(packet)
    end

    # @return [ByteString] a complete message
    def receive
      size = T.let(0, Integer)
      loop do
        lenbuf = bufread(2)
        size = unpack_u16(lenbuf)
        break unless size.zero?
        # leftover data?
        @buf = ""
      end

      res = bufread(size)
      res
    end

    private

    # read must not be called with a too low value :-/
    def bufread(n)
      @buf += read(10000) while @buf.bytesize < n
      ret = @buf[0, n]
      @buf = @buf[n..-1]
      logger.debug "R<-(#{ret.bytesize})#{ret.inspect}"
      ret
    end
  end
end
