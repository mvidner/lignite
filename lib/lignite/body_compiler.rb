module Lignite
  # Less-than (32 bit)
  class Lt32 # < Condition
    def initialize(a, b)
      @a = a
      @b = b
    end

    def not
      Ge32.new(@a, @b)
    end

    def jump_forward(compiler, body_size)
      compiler.jr_lt32(@a, @b, Complex(body_size, 2))
    end

    def jump_back(compiler, body_size, self_size = nil)
      if self_size.nil?
        fake = compiler.clone_context
        jump_back(fake, body_size, 0)
        self_size = fake.bytes.bytesize
      end

      compiler.jr_lt32(@a, @b, Complex(- (body_size + self_size), 2))
    end
  end

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

    def clone_context
      BodyCompiler.new(@globals, @locals, @declared_objects)
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
      # the jump takes up 5 bytes: JR_TRUE, LV0(flag8), LC2, LO, HI
      jr_true(flag8, Complex(- (subc.bytes.bytesize + 5), 2))
    end

    def loop_while(a, b)
      if a.respond_to? :call
        loop_while_post(b, &a)
      else
        loop_while_pre(a, &b)
      end
    end

    def loop_while_post(condition, &body)
      subc = BodyCompiler.new(@globals, @locals, @declared_objects)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      body_size = subc.bytes.bytesize
      condition.jump_back(self, body_size)
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
