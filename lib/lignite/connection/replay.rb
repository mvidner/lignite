require "yaml"

module Lignite
  class Connection
    class ReplayError < RuntimeError
    end

    # Replays a recorded communication.
    # It checks that #send matches the stored sends, replays the #receive.
    class Replay < Connection
      def initialize(filename)
        @filename = filename

        # [
        #  {"SEND" => "foo"},
        #  {"SEND" => "foo2"},
        #  {"RECV" => "adfafd"},
        #  {"SEND" => "foo2"},
        #  {"RECV" => "adfafd"}
        # ]
        @stream = YAML.load_file(filename)
      end

      # @param payload [ByteString]
      def send(payload)
        recorded = @stream.shift
        raise ReplayError, "Nothing left in the recording" if recorded.nil?
        hex = recorded["SEND"]
        raise ReplayError, "Called SEND but the recording says RECV" if hex.nil?
        data = hex_to_bin(hex)
        raise ReplayError, "Called SEND but the recorded data does not match" if data != payload
      end

      # @return [ByteString] a complete message
      def receive
        recorded = @stream.shift
        raise ReplayError, "Nothing left in the recording" if recorded.nil?
        hex = recorded["RECV"]
        raise ReplayError, "Called RECV but the recording says SEND" if hex.nil?
        hex_to_bin(hex)
      end

      def close
        super
        raise ReplayError, "Called close but the recording has leftover data" unless @stream.empty?
      end

      private

      # @param hex [String] "413432"
      # @return [ByteString] "A42"
      def hex_to_bin(hex)
        [hex].pack("H*")
      end
    end
  end
end