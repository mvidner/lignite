require "socket"

module Lignite
  class Connection
    class Bluetooth < Connection
      AF_BLUETOOTH = 31
      BTPROTO_RFCOMM = 3

      # @param address [String] "11:22:33:44:55:66"
      def initialize(address = address_from_file)
        super()
        @sock = Socket.new(AF_BLUETOOTH, :STREAM, BTPROTO_RFCOMM)
        addr_b = address.split(/:/).map { |x| x.to_i(16) }
        channel = 1
        sockaddr = [AF_BLUETOOTH, 0, *addr_b.reverse, channel, 0].pack("C*")
        # common exceptions:
        # "Errno::EHOSTUNREACH: No route to host":
        #   - No BT adapter
        #   - BT is disabled; use `hciconfig hci0 up`
        # "Errno::EHOSTDOWN: Host is down":
        #   - Turn the brick on
        #   - enable BT on the brick
        #   - disconnect other programming apps
        @sock.connect(sockaddr)
      end

      def self.config_filename
        "#{ENV['HOME']}/.config/lignite-btaddr"
      end

      def self.template_config_filename
        # TODO: also find it from a gem
        File.expand_path("../../../../data/lignite-btaddr", __FILE__)
      end

      def address_from_file
        s = File.read(self.class.config_filename)
        s.lines.grep(/^[0-9a-fA-F]/).first.strip
      end

      def read(n)
        @sock.recv(n)
      end

      def write(s)
        @sock.write(s)
      end

      def close
        @sock.shutdown
        super
      end
    end
  end
end
