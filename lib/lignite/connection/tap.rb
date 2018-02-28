require "yaml"

module Lignite
  class Connection
    # An adapter that delegates to another connection
    # and records the communication
    class Tap < Connection
      def initialize(conn, filename)
        raise "File #{filename} exists, will not overwrite" if File.exist?(filename)
        @conn = conn
        @filename = filename
        @packets = []
      end

      # @param payload [ByteString]
      def send(payload)
        r = @conn.send(payload)
        @packets << { "SEND" => bin_to_hex(payload) }
        r
      end

      # @return [ByteString] a complete message
      def receive
        s = @conn.receive
        @packets << { "RECV" => bin_to_hex(s) }
        s
      end

      def close
        y = YAML.dump(@packets)
        File.write(@filename, y)
        super
        @conn.close
      end

      private

      # @param bin [ByteString] "A42"
      # @return [String] "413432"
      def bin_to_hex(bin)
        bin.unpack("H*").first
      end
    end
  end
end
