module Lignite
  # A Message has 3 common parts:
  # - length u16, (not including the length itself);
  #   this is added by {MessageSender#send}
  #   and stripped by {MessageSender#receive}
  # - msgid, u16
  # - type, u8
  # and then a type-specific body.
  # It is sent or received via {MessageSender}
  class Message
    include Bytes
    extend Bytes
    extend Logger
    @msg_counter = rand(65535)

    def self.msgid
      @msg_counter += 1
      logger.debug "MSGID #{@msg_counter}"
      @msg_counter
    end

    attr_reader :msgid, :type, :body

    def initialize(type:, body:)
      @msgid = self.class.msgid
      @type = type
      @body = body
    end

    # not including the length
    def bytes
      u16(@msgid) + u8(@type) + @body
    end

    def self.system_command_with_reply(body)
      new(type: 0x01, body: body)
    end

    def self.system_command_no_reply(body)
      new(type: 0x81, body: body)
    end

    def self.direct_command_with_reply(body)
      new(type: 0x00, body: body)
    end

    def self.direct_command_no_reply(body)
      new(type: 0x80, body: body)
    end

    # @param bytes [ByteString] does not include the length field
    def self.reply_from_bytes(bytes)
      msgid = unpack_u16(bytes[0..1])
      type = unpack_u8(bytes[2])
      body = bytes[3..-1]
      case type
      when 0x03               # SYSTEM_REPLY
        SystemReply.new(msgid: msgid, error: false, body: body)
      when 0x05               # SYSTEM_REPLY_ERROR
        SystemReply.new(msgid: msgid, error: true, body: body)
      when 0x02               # DIRECT_REPLY
        DirectReply.new(msgid: msgid, error: false, body: body)
      when 0x04               # DIRECT_REPLY_ERROR
        DirectReply.new(msgid: msgid, error: true, body: body)
      else
        raise "Unexpected reply type %x" % type
      end
    end
  end

  class SystemReply < Message
    def initialize(msgid:, error:, body:)
      @msgid = msgid
      @error = error
      @command = unpack_u8(body[0])
      @status = unpack_u8(body[1])
      @data = body[2..-1]
    end

    attr_reader :msgid, :error, :command, :status, :data

    def error?
      @error
    end
  end

  class DirectReply < Message
    def initialize(msgid:, error:, body:)
      @msgid = msgid
      @error = error
      @globals = body
    end

    attr_reader :msgid, :error, :globals

    def error?
      @error
    end
  end
end
