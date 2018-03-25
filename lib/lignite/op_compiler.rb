require "lignite/defines"
require "lignite/enums"
require "lignite/ev3_ops"

module Lignite
  # Compiles methods for all the instructions in ev3.yml
  # The methods return the {ByteString}s corresponding to the ops.
  class OpCompiler
    include Logger
    include Bytes
    include Ev3Ops

    # @param globals [Variables,nil]
    # @param locals  [Variables,nil]
    def initialize(globals = nil, locals = nil)
      @globals = globals
      @locals = locals
    end

    private

    PRIMPAR_SHORT      = 0x00
    PRIMPAR_LONG       = 0x80

    PRIMPAR_CONST      = 0x00
    PRIMPAR_VARIABEL   = 0x40
    PRIMPAR_LOCAL      = 0x00
    PRIMPAR_GLOBAL     = 0x20
    PRIMPAR_HANDLE     = 0x10
    PRIMPAR_ADDR       = 0x08

    PRIMPAR_INDEX      = 0x1F
    PRIMPAR_CONST_SIGN = 0x20
    PRIMPAR_VALUE      = 0x3F

    PRIMPAR_BYTES      = 0x07

    PRIMPAR_STRING_OLD = 0
    PRIMPAR_1_BYTE     = 1
    PRIMPAR_2_BYTES    = 2
    PRIMPAR_4_BYTES    = 3
    PRIMPAR_STRING     = 4

    PRIMPAR_LABEL      = 0x20

    # @param n [Integer] value to encode
    # @param next_size [Integer] how many bytes follow the initial opcode
    # @return [ByteString]
    def numeric_literal_with_size(n, next_size)
      bytes = case next_size
              when 0
                [n & PRIMPAR_VALUE]
              when 1
                [PRIMPAR_LONG | PRIMPAR_1_BYTE, n & 0xff]
              when 2
                [PRIMPAR_LONG | PRIMPAR_2_BYTES, n & 0xff, (n >> 8) & 0xff]
              else
                [PRIMPAR_LONG | PRIMPAR_4_BYTES,
                 n & 0xff, (n >> 8) & 0xff, (n >> 16) & 0xff, (n >> 24) & 0xff]
      end
      bytes.map(&:chr).join("")
    end

    # @param n [Integer] value to encode
    # @param next_size [Integer] how many bytes follow the initial opcode
    # @return [ByteString]
    def numeric_literal(n, next_size = nil)
      next_size ||= if (-31..31).cover? n
        0
      elsif (-127..127).cover? n
        1
      elsif (-32767..32767).cover? n
        2
      else
        4
      end
      numeric_literal_with_size(n, next_size)
    end

    # @return [ByteString]
    def make_v(n, local_or_global)
      vartag = PRIMPAR_VARIABEL | local_or_global
      bytes = if (0..31).cover? n
        [vartag | (n & PRIMPAR_VALUE)]
      elsif (0..255).cover? n
        [vartag | PRIMPAR_LONG | PRIMPAR_1_BYTE, n & 0xff]
      elsif (0..65535).cover? n
        [vartag | PRIMPAR_LONG | PRIMPAR_2_BYTES, n & 0xff, (n >> 8) & 0xff]
      else
        [vartag | PRIMPAR_LONG | PRIMPAR_4_BYTES,
         n & 0xff, (n >> 8) & 0xff, (n >> 16) & 0xff, (n >> 24) & 0xff]
      end
      bytes.map(&:chr).join("")
    end

    # Reference a variable.
    # (For declaring, see {VariableDeclarer}.)
    # @return [ByteString]
    def make_var(sym)
      raise "No variables declared, cannot process symbols" if @locals.nil? && @globals.nil?
      if @locals.key?(sym)
        o = @locals.offset(sym)
        make_v(o, PRIMPAR_LOCAL)
      elsif @globals.key?(sym)
        o = @globals.offset(sym)
        make_v(o, PRIMPAR_GLOBAL)
      else
        raise "Variable #{sym} not found"
      end
    end

    # @return [ByteString]
    def param_n_multiple(*args)
      u8(args.size) + param_multiple(*args)
    end

    # @return [ByteString]
    def param_multiple(*args)
      args.map { |a| param_simple(a) }.join("")
    end

    # @return [ByteString]
    def param_simple_numeric(x)
      case x
      when Integer
        numeric_literal(x)
      when Float
        u8(0x83) + f32(x)
      else
        raise ArgumentError, "Unexpected type: #{x.class}"
      end
    end

    # @return [ByteString]
    def param_simple(x)
      case x
      when Numeric
        param_simple_numeric(x)
      when JumpOffset
        numeric_literal(x.value, x.size)
      when String
        u8(0x80) + x + u8(0x00)
      when true
        param_simple(1)
      when false
        param_simple(0)
      when Symbol
        make_var(x)
      else
        raise ArgumentError, "Unexpected type: #{x.class}"
      end
    end
  end
end
