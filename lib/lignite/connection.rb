module Lignite
  # The communication channel to the robot.
  # The callers use {#send} and {#receive}.
  # Subclasses implement {#read}, {#write} and {#close}.
  class Connection
    include Bytes
    include Logger

    # @return [Connection] Try a {Usb} connection first, then a {Bluetooth} one.
    def self.create
      @c ||= Replay.new(ENV["LIGNITE_REPLAY"]) if ENV["LIGNITE_REPLAY"]

      @c ||= begin
               Usb.new
             rescue NoUsbDevice
               Bluetooth.new
             end

      @c = Tap.new(@c, ENV["LIGNITE_TAP"]) if ENV["LIGNITE_TAP"]
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

    # @!method write(data)
    #   @param data [ByteString]

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
      size = nil
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
