module Lignite
  # Compile a conditional jump forward or backward
  class Condition
    # Call that instruction of the compiler
    # that jumps by *offset* according to the condition that we implement
    def cond_jump(_compiler, _offset)
      raise ScriptError, "subclasses must override this"
    end

    # Negation of this condition.
    # An `if(cond){ body }` becomes roughly `cond.not.jump_forward(body.size); body`
    def not
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

  # A condition that is always true
  class Always < Condition
    def not
      Never.new
    end

    def cond_jump(compiler, offset)
      compiler.jr(JumpOffset.new(offset))
    end
  end

  # A condition that is never true
  class Never < Condition
    def not
      Always.new
    end

    def cond_jump(compiler, _offset)
      # Never jump: do a jump of size 0
      # but it must be a jump because code size calculations need that
      compiler.jr(JumpOffset.new(0))
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
      compiler.jr_lt32(@a, @b, JumpOffset.new(offset))
    end
  end

  # Greater-than-or-equal (32 bit)
  class Gteq32 < Condition
    def initialize(a, b)
      @a = a
      @b = b
    end

    def not
      Lt32.new(@a, @b)
    end

    def cond_jump(compiler, offset)
      compiler.jr_gteq32(@a, @b, JumpOffset.new(offset))
    end
  end

  # Test a boolean flag
  class Flag < Condition
    def initialize(f)
      @f = f
    end

    def not
      NotFlag.new(@f)
    end

    def cond_jump(compiler, offset)
      compiler.jr_true(@f, JumpOffset.new(offset))
    end
  end

  # Test a negated boolean flag
  class NotFlag < Condition
    def initialize(f)
      @f = f
    end

    def not
      Flag.new(@f)
    end

    def cond_jump(compiler, offset)
      compiler.jr_false(@f, JumpOffset.new(offset))
    end
  end
end
