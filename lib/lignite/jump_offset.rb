# typed: true
module Lignite
  # A specialized Integer.
  # When compiling jumps, the jump instruction itself must have a constant size
  # so this class is special-cased in {OpCompiler#param_simple}.
  class JumpOffset
    # @return [Integer]
    attr_reader :value

    def size
      2
    end

    def initialize(v)
      raise "Jumping too far: #{value}" if v.abs > 32767
      @value = v
    end
  end
end
