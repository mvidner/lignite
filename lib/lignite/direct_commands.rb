module Lignite
  class DirectCommands
    # @param conn [Connection]
    def initialize(conn = Connection.create)
      @op_compiler = OpCompiler.new
      @sender = MessageSender.new(conn)
      @globals = nil
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
      ret # TODO decode according to type
    end

    def block(&body)
      locals = Variables.new
      bodyc = BodyCompiler.new(@globals, locals)
      bodyc.instance_exec(&body)

      bs = bodyc.bytes
      lsize = locals.bytesize
      if @globals
        @sender.direct_command_with_reply(bs, global_size: @globals.bytesize, local_size: lsize)
      else
        @sender.direct_command(bs, global_size: 0, local_size: lsize)
      end
    end

    def method_missing(name, *args)
      if @op_compiler.respond_to?(name)
        insb = @op_compiler.send(name, *args)
        @sender.direct_command(insb)
      else
        super
      end
    end
  end
end
