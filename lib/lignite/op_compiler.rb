require "yaml"

module Lignite
  # Dynamically constructs methods for all the instructions in ev3.yml
  # The methods return the {ByteString}s corresponding to the ops.
  class OpCompiler
    # TODO: doing it dynamically
    # - is slow
    # - makes the implementation harder to understand
    # - means we cannot use YARD to document the API
    # Therefore we should generate (most of) op_compiler.rb statically from
    # ev3.yml ahead of the time.

    include Bytes
    include Logger
    extend Logger

    # A marker for features that are not implemented yet
    class TODO < StandardError
    end

    def self.load_const(name, value)
      raise "duplicate constant #{name}" if Lignite.const_defined?(name)
      Lignite.const_set(name, value)
    end

    def self.load_op(oname, odata)
      ovalue = odata["value"]
      oparams = odata["params"]
      p1 = oparams.first
      if p1 && p1["type"] == "SUBP"
        commands = p1["commands"]
        commands.each do |cname, cdata|
          cvalue = cdata["value"]
          load_const(cname, cvalue)
          cparams = cdata["params"]
          define_op("#{oname}_#{cname}", ovalue, cvalue, cparams)
        end
        define_multiop(oname, commands)
      else
        define_op(oname, ovalue, nil, oparams)
      end
    end

    def self.define_multiop(oname, commands)
      names = commands.map do |cname, cdata|
        csym = cname.downcase.to_sym
        cvalue = cdata["value"]
        [cvalue, csym]
      end.to_h

      osym = oname.downcase.to_sym
      define_method(osym) do |*args|
        logger.debug "called #{osym} with #{args.inspect}"
        cvalue = args.shift
        csym = names.fetch(cvalue)
        send("#{osym}_#{csym}", *args)
      end
    end

    def self.define_op(oname, ovalue, cvalue, params)
      check_arg_count = true
      param_handlers = params.map do |par|
        case par["type"]
        when "PARLAB"           # a label, only one opcode
          raise TODO
        when "PARNO"            # the value says how many other params follow
          check_arg_count = false
          ->(x) { param_simple(x) }
        when "PARS"             # string
          raise TODO
        when "PARV"             # value, type depends
          raise TODO
        when "PARVALUES"
          raise TODO
        when "PAR8", "PAR16", "PAR32", "PARF"
          ->(x) { param_simple(x) }
        else
          raise "Unhandled param type #{par["type"]}"
        end
      end

      osym = oname.downcase.to_sym
      define_method(osym) do |*args|
        logger.debug "called #{osym} with #{args.inspect}"
        if check_arg_count && args.size != param_handlers.size
          raise ArgumentError, "expected #{param_handlers.size} arguments, got #{args.size}"
        end

        bytes = u8(ovalue)
        bytes += param_simple(cvalue) unless cvalue.nil?

        bytes += args.zip(param_handlers).map do |a, h|
          h ||= ->(x) { param_simple(x) }
          # h.call(a) would have self = Op instead of #<Op>
          instance_exec(a, &h)
        end.join("")
        logger.debug "returning bytecode: #{bytes.inspect}"
        bytes
      end
    rescue TODO
      logger.debug "Could not define #{oname}"
    end

    @loaded = false

    def self.load_yml
      return if @loaded
      fname = File.expand_path("../../../data/ev3.yml", __FILE__)
      yml = YAML.load_file(fname)
      op_hash = yml["ops"]
      op_hash.each do |oname, odata|
        load_op(oname, odata)
      end

      defines = yml["defines"]
      defines.each do |dname, ddata|
        load_const(dname, ddata["value"])
      end

      enums = yml["enums"]
      enums.each_value do |edata|
        edata["members"].each do |mname, mdata|
          load_const(mname, mdata["value"])
        end
      end

      @loaded = true
    end

    # @param globals [Variables,nil]
    # @param locals  [Variables,nil]
    def initialize(globals = nil, locals = nil)
      self.class.load_yml
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
    def param_simple(x)
      case x
      when Integer
        make_lc(x).map(&:chr).join("")
      when Complex
        # a Complex number: real: just like an Integer above, but imag tells how many bytes to use for it
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
