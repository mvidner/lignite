module Lignite
  class DirectCommands
    include Bytes

    def self.run(conn = Connection.create, &block)
      dc = new(conn)
      dc.instance_exec(&block)
      dc.close
    end

    # @param conn [Connection]
    def initialize(conn = Connection.create)
      @op_compiler = OpCompiler.new
      @conn = conn
      @globals = nil
    end

    def close
      @conn.close
    end

    def variables
      @globals
    end
    include VariableDeclarer

    def with_reply(&body)
      @globals = Variables.new
      ret_bytes = instance_exec(&body)
      ret = @globals.unpack(ret_bytes)
      @globals = nil
      ret # TODO: decode according to type
    end

    def block(&body)
      locals = Variables.new
      bodyc = BodyCompiler.new(@globals, locals)
      bodyc.instance_exec(&body)

      bs = bodyc.bytes
      lsize = locals.bytesize
      if @globals
        direct_command_with_reply(bs, global_size: @globals.bytesize, local_size: lsize)
      else
        direct_command(bs, global_size: 0, local_size: lsize)
      end
    end

    def method_missing(name, *args)
      if @op_compiler.respond_to?(name)
        insb = @op_compiler.send(name, *args)
        direct_command(insb)
      else
        super
      end
    end

    def respond_to_missing?(name, _include_private)
      @op_compiler.respond_to?(name) || super
    end

    private

    def direct_command(instr_bytes, global_size: 0, local_size: 0)
      body = u16(var_alloc(global_size: global_size, local_size: local_size)) +
        instr_bytes
      cmd = Message.direct_command_no_reply(body)
      @conn.send(cmd.bytes)
    end

    def direct_command_with_reply(instr_bytes, global_size: 0, local_size: 0)
      body = u16(var_alloc(global_size: global_size, local_size: local_size)) +
        instr_bytes
      cmd = Message.direct_command_with_reply(body)
      @conn.send(cmd.bytes)

      reply = Message.reply_from_bytes(@conn.receive)
      assert_match(reply.msgid, cmd.msgid, "Reply id")
      if reply.error?
        raise VMError # no details?
      end

      reply.globals
    end

    def var_alloc(global_size:, local_size:)
      var_alloc = global_size & 0x3ff
      var_alloc |= (local_size & 0x3f) << 10
      var_alloc
    end

    def assert_match(actual, expected, description)
      return if actual == expected
      raise "#{description} does not match, expected #{expected}, actual #{actual}"
    end
  end
end
