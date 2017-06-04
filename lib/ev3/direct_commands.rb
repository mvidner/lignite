module Ev3
  # FIXME: cannot handle replies
  class DirectCommands
    def initialize(conn)
      @op_compiler = OpCompiler.new
      @sender = MessageSender.new(conn)
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
