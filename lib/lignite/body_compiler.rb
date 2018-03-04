module Lignite
  # Extends {OpCompiler} by
  # - variable declarations: {VariableDeclarer}
  # - high level flow control: {#loop}
  class BodyCompiler
    # @return [ByteString]
    attr_reader :bytes
    # @return [Variables]
    attr_reader :locals

    attr_reader :declared_objects

    def variables
      locals
    end
    include VariableDeclarer

    def parameters
      locals
    end
    include ParameterDeclarer

    def param_decl_header
      parameters.param_decl_header
    end

    def initialize(globals, locals, declared_objects)
      @bytes = ""
      @globals = globals
      @locals = locals
      @declared_objects = declared_objects
      @op_compiler = OpCompiler.new(@globals, @locals)
    end

    def if(flag8, &body)
      subc = BodyCompiler.new(@globals, @locals, @declared_objects)
      subc.instance_exec(&body)

      jr_false(flag8, Complex(subc.bytes.bytesize, 2))
      @bytes << subc.bytes
    end

    def loop(&body)
      subc = BodyCompiler.new(@globals, @locals, @declared_objects)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR, LC2, LO, HI
      jr(Complex(- (subc.bytes.bytesize + 4), 2))
    end

    def loop_while_postcond(flag8, &body)
      subc = BodyCompiler.new(@globals, @locals, @declared_objects)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR_TRUE, LV0(flag8), LC2, LO, HI
      jr_true(flag8, Complex(- (subc.bytes.bytesize + 5), 2))
    end

    def call(name, *args)
      obj_id = declared_objects.index_of(name)
      raise "Name #{name} not found" if obj_id.nil?

      # TODO: check that args match their declaration
      super(obj_id, *args) # Ev3Ops::call
    end

    # Delegate the ops to the {OpCompiler},
    # but also aggregate the result in @bytes.
    def method_missing(name, *args)
      super unless @op_compiler.respond_to?(name)

      @bytes += @op_compiler.send(name, *args)
    end

    def respond_to_missing?(name, _include_private)
      @op_compiler.respond_to?(name) || super
    end
  end
end
