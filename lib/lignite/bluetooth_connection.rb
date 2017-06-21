require "socket"

module Lignite
  class BluetoothConnection
    AF_BLUETOOTH = 31
    BTPROTO_RFCOMM = 3

    # @param address [String] "11:22:33:44:55:66"
    def initialize(address = address_from_file)
      @sock = Socket.new(AF_BLUETOOTH, :STREAM, BTPROTO_RFCOMM)
      addr_b = address.split(/:/).map { |x| x.to_i(16) }
      channel = 1
      sockaddr = [AF_BLUETOOTH, 0, *addr_b.reverse, channel, 0].pack("C*")
      @sock.connect(sockaddr)
    end

    def address_from_file
      fn = "#{ENV['HOME']}/.config/lignite-btaddr"
      s = File.read(fn)
      s.lines.grep(/^[0-9a-fA-F]/).first.strip
    end

    def read(n)
      @sock.recv(n)
    end

    def write(s)
      @sock.write(s)
    end
  end
end
