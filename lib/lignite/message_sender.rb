module Lignite

  # FIXME: Possibly merge with Connection (UsbConnection)
  class MessageSender
    include Bytes
    include Logger

    def initialize(connection)
      @c = connection
      @buf = ""
    end

    def direct_command(instr_bytes, global_size: 0, local_size: 0)
      body = u16(var_alloc(global_size: global_size, local_size: local_size)) +
             instr_bytes
      cmd = Message.direct_command_no_reply(body)
      send(cmd.bytes)
    end

    def direct_command_with_reply(instr_bytes, global_size: 0, local_size: 0)
      body = u16(var_alloc(global_size: global_size, local_size: local_size)) +
             instr_bytes
      cmd = Message.direct_command_with_reply(body)
      send(cmd.bytes)

      reply = Message.reply_from_bytes(receive)
      assert_match(reply.msgid, cmd.msgid, "Reply id")
      if reply.error?
        raise "VMError"         # no details?
      end

      reply.data
    end

    def system_command_with_reply(instr_bytes)
      cmd = Message.system_command_with_reply(instr_bytes)
      send(cmd.bytes)

      reply = Message.reply_from_bytes(receive)
      assert_match(reply.msgid, cmd.msgid, "Reply id")
      assert_match(reply.command, unpack_u8(instr_bytes[0]), "Command num")
      if reply.error?
        raise "VMError, %u" % reply.status
      end

      reply.data
    end

    private

    def send(payload)
      packet = u16(payload.bytesize) + payload
      logger.debug "-> #{packet.inspect}"
      @c.write(packet)
    end

    # read must not be called with a too low value :-/
    def bufread(n)
      while n > @buf.bytesize
        @buf += @c.read(10000)
      end
      ret = @buf[0, n]
      @buf = @buf[n..-1]
      logger.debug "R<-(#{ret.bytesize})#{ret.inspect}"
      ret
    end

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

    def var_alloc(global_size:, local_size:)
      var_alloc = global_size & 0x3ff
      var_alloc |= (local_size & 0x3f) << 10
    end

    def assert_match(actual, expected, description)
      return if actual == expected
      raise "#{description} does not match, expected #{expected}, actual #{actual}"
    end
  end
end
