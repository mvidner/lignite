module Lignite
  # FIXME: cannot handle replies
  class DirectCommands
    # @param conn [Connection]
    def initialize(conn = Connection.create)
      @op_compiler = OpCompiler.new
      @sender = MessageSender.new(conn)
    end

    def block(&body)
      locals = Variables.new
      bodyc = BodyCompiler.new(locals)
      bodyc.instance_exec(&body)
      @sender.direct_command(bodyc.bytes, local_size: locals.bytesize)
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
