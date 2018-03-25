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
      jr_false(flag8, JumpOffset.new(truec.bytes.bytesize + 4))
      @bytes << truec.bytes
      jr(JumpOffset.new(falsec.bytes.bytesize))
      @bytes << falsec.bytes
    end

    def loop(&body)
      subc = clone_context
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR, LC2, LO, HI
      jr(JumpOffset.new(- (subc.bytes.bytesize + 4)))
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
      jr(JumpOffset.new(-(fw_jump_size + subc.bytes.bytesize + 4)))
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
