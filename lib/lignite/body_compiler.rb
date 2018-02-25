module Lignite
  # Extends {OpCompiler} by
  # - variable declarations: {VariableDeclarer}
  # - high level flow control: {#loop}
  class BodyCompiler
    # @return [ByteString]
    attr_reader :bytes
    # @return [Variables]
    attr_reader :locals

    def variables
      locals
    end
    include VariableDeclarer

    def initialize(globals, locals)
      @bytes = ""
      @globals = globals
      @locals = locals
      @op_compiler = OpCompiler.new(@globals, @locals)
    end

    def if(flag8, &body)
      subc = BodyCompiler.new(@globals, @locals)
      subc.instance_exec(&body)

      jr_false(flag8, Complex(subc.bytes.bytesize, 2))
      @bytes << subc.bytes
    end

    def loop(&body)
      subc = BodyCompiler.new(@globals, @locals)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR, LC2, LO, HI
      jr(Complex(- (subc.bytes.bytesize + 4), 2))
    end

    def loop_while_postcond(flag8, &body)
      subc = BodyCompiler.new(@globals, @locals)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR_TRUE, LV0(flag8), LC2, LO, HI
      jr_true(flag8, Complex(- (subc.bytes.bytesize + 5), 2))
    end

    # Delegate the ops to the {OpCompiler},
    # but also aggregate the result in @bytes.
    def method_missing(name, *args)
      super unless @op_compiler.respond_to?(name)

      @bytes += @op_compiler.send(name, *args)
    end
  end
end
