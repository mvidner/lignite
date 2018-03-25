module Lignite
  class Condition
    # Call that instruction of the compiler
    # that jumps by *offset* according to the condition that we implement
    def cond_jump(_compiler, _offset)
      raise ScriptError, "subclasses must override this"
    end

    def jump_forward(compiler, body_size)
      cond_jump(compiler, body_size)
    end

    def jump_back(compiler, body_size, self_size = nil)
      if self_size.nil?
        fake = compiler.clone_context
        jump_back(fake, body_size, 0)
        self_size = fake.bytes.bytesize
      end

      cond_jump(compiler, - (body_size + self_size))
    end
  end

  class Always < Condition
    def not
      Never.new
    end

    def cond_jump(compiler, offset)
      compiler.jr(Complex(offset, 2))
    end
  end

  class Never < Condition
    def not
      Always.new
    end

    def cond_jump(compiler, _offset)
      # Never jump: do a jump of size 0
      # but it must be a jump because code size calculations need that
      compiler.jr(Complex(0, 2))
    end
  end

  # Less-than (32 bit)
  class Lt32 < Condition
    def initialize(a, b)
      @a = a
      @b = b
    end

    def not
      Gteq32.new(@a, @b)
    end

    def cond_jump(compiler, offset)
      compiler.jr_lt32(@a, @b, Complex(offset, 2))
    end
  end

  class Gteq32 < Condition
    def initialize(a, b)
      @a = a
      @b = b
    end

    def not
      Lt32.new(@a, @b)
    end

    def cond_jump(compiler, offset)
      compiler.jr_gteq32(@a, @b, Complex(offset, 2))
    end
  end

  class Flag < Condition
    def initialize(f)
      @f = f
    end

    def not
      NotFlag.new(@f)
    end

    def cond_jump(compiler, offset)
      compiler.jr_true(@f, Complex(offset, 2))
    end
  end

  class NotFlag < Condition
    def initialize(f)
      @f = f
    end

    def not
      Flag.new(@f)
    end

    def cond_jump(compiler, offset)
      compiler.jr_false(@f, Complex(offset, 2))
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

    def if(cond, &body)
      cond = Flag.new(cond) unless cond.is_a? Condition

      subc = clone_context
      subc.instance_exec(&body)

      cond.not.jump_forward(self, subc.bytes.bytesize)
      @bytes << subc.bytes
    end

    def if_else(flag8, body_true, body_false)
      truec = clone_context
      falsec = clone_context
      truec.instance_exec(&body_true)
      falsec.instance_exec(&body_false)

      # 4 is the unconditional jump size
      jr_false(flag8, Complex(truec.bytes.bytesize + 4, 2))
      @bytes << truec.bytes
      jr(Complex(falsec.bytes.bytesize, 2))
      @bytes << falsec.bytes
    end

    def loop(&body)
      subc = clone_context
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR, LC2, LO, HI
      jr(Complex(- (subc.bytes.bytesize + 4), 2))
    end

    def loop_while_postcond(flag8, &body)
      loop_while(body, Flag.new(flag8))
    end

    def loop_while(a, b)
      if a.respond_to? :call
        loop_while_post(b, &a)
      else
        loop_while_pre(a, &b)
      end
    end

    def loop_while_post(condition, &body)
      subc = clone_context
      subc.instance_exec(&body)
      @bytes << subc.bytes
      body_size = subc.bytes.bytesize
      condition.jump_back(self, body_size)
    end

    def loop_until_pre(condition, &body)
      subc = clone_context
      subc.instance_exec(&body)
      ofs1 = @bytes.bytesize
      condition.jump_forward(self, subc.bytes.bytesize + 4)
      ofs2 = @bytes.bytesize
      fw_jump_size = ofs2 - ofs1
      @bytes << subc.bytes
      jr(Complex(-(fw_jump_size + subc.bytes.bytesize + 4), 2))
    end

    def call(name, *args)
      obj_id = declared_objects.index_of(name)
      raise "Name #{name} not found" if obj_id.nil?

      # TODO: check that args match their declaration
      # In particular, mixing up data32 with dataf passes the VM validity check
      # but then misinterprets the bits.
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
