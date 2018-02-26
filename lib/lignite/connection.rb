module Lignite
  class Connection
    include Bytes
    include Logger

    # @return [Connection] Try a {Usb} connection first, then a {Bluetooth} one.
    def self.create
      if ENV["LIGNITE_REPLAY"]
        @c ||= Replay.new(ENV["LIGNITE_REPLAY"])
      end

      @c ||= begin
               Usb.new
             rescue NoUsbDevice
               Bluetooth.new
             end

      if ENV["LIGNITE_TAP"]
        @c = Tap.new(@c, ENV["LIGNITE_TAP"])
      end
      @c
    end

    def self.reset
      @c = nil
    end

    def initialize
      @buf = ""
    end

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

    # @!group Subclasses must implement
    # @!method read(maxlen)
    # @!method write(data)
    # @!method close
    
    private

    # read must not be called with a too low value :-/
    def bufread(n)
      while n > @buf.bytesize
        @buf += read(10000)
      end
      ret = @buf[0, n]
      @buf = @buf[n..-1]
      logger.debug "R<-(#{ret.bytesize})#{ret.inspect}"
      ret
    end
  end
end
