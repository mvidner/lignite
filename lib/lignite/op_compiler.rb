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

    def make_lcn(n, bytes)
      case bytes
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
    end

    def make_lc(n, bytes = nil)
      bytes ||= if (-31..31).cover? n
        0
      elsif (-127..127).cover? n
        1
      elsif (-32767..32767).cover? n
        2
      else
        4
      end
      make_lcn(n, bytes)
    end

    def make_v(n, local_or_global)
      vartag = PRIMPAR_VARIABEL | local_or_global
      if (0..31).cover? n
        [vartag | (n & PRIMPAR_VALUE)]
      elsif (0..255).cover? n
        [vartag | PRIMPAR_LONG | PRIMPAR_1_BYTE, n & 0xff]
      elsif (0..65535).cover? n
        [vartag | PRIMPAR_LONG | PRIMPAR_2_BYTES, n & 0xff, (n >> 8) & 0xff]
      else
        [vartag | PRIMPAR_LONG | PRIMPAR_4_BYTES,
         n & 0xff, (n >> 8) & 0xff, (n >> 16) & 0xff, (n >> 24) & 0xff]
      end
    end

    # Reference a variable.
    # (For declaring, see {VariableDeclarer}.)
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
    def param_multiple(*args)
      u8(args.size) + args.map { |a| param_simple(a) }.join("")
    end

    # @return [ByteString]
    def param_simple(x)
      case x
      when Integer
        make_lc(x).map(&:chr).join("")
      when Complex
        # a Complex number:
        #   #real: just like an Integer above, but
        #   #imag tells how many bytes to use for it
        make_lc(x.real, x.imag).map(&:chr).join("")
      when String
        u8(0x80) + x + u8(0x00)
      when Float
        u8(0x83) + f32(x)
      when Symbol
        make_var(x).map(&:chr).join("")
      else
        raise ArgumentError, "Unexpected type: #{x.class}"
      end
    end
  end
end
