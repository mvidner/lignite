require "yaml"

module Ev3
  # A String of bytes (with Encoding::BINARY)
  class ByteString < String
    # empty class, just for documentation purposes
  end

  class Op
    include Bytes

    class TODO < StandardError
    end

    def self.load_op(oname, odata)
      ovalue = odata["value"]
      oparams = odata["params"]
      p1 = oparams.first
      if p1 && p1["type"] == "SUBP"
        commands = p1["commands"]
        commands.each do |cname, cdata|
          cvalue = cdata["value"]
          cparams = cdata["params"]
          define_op("#{oname}_#{cname}", ovalue, cvalue, cparams)
        end
      else
        define_op(oname, ovalue, nil, oparams)
      end
    end

    def self.define_op(oname, ovalue, cvalue, params)
      param_handlers = params.map do |par|
        case par["type"]
        when "PARF"             # float
          raise TODO
        when "PARLAB"           # a label, only one opcode
          raise TODO
        when "PARNO"            # variable number of params
          raise TODO
        when "PARS"             # string
          raise TODO
        when "PARV"             # value, type depends
          raise TODO
        when "PARVALUES"
          raise TODO
        when "PAR16", "PAR32", "PAR8"
          ->(x) { param_simple(x) }
        else
          raise "Unhandled param type #{par["type"]}"
        end
      end

      osym = oname.downcase.to_sym
      define_method(osym) do |*args|
        puts "called #{osym} with #{args.inspect}"
        if args.size != param_handlers.size
          raise ArgumentError, "expected #{param_handlers.size} arguments, got #{args.size}"
        end

        bytes = u8(ovalue)
        bytes += param_simple(cvalue) unless cvalue.nil?

        bytes += param_handlers.zip(args).map do |h, a|
          # h.call(a) would have self = Op instead of #<Op>
          instance_exec(a, &h)
        end.join("")
        puts "returning bytecode: #{bytes.inspect}"
        bytes
      end
    end

    def self.load_yml
      op_hash = YAML.load_file("ev3.yml")["ops"]
      op_hash.each do |oname, odata|
        begin
          load_op(oname, odata)
        rescue TODO
        end
      end
    end

    private

    def make_lc(n)
      if (-31 .. 31).include? n
        return [n & 0x3f]
      elsif (-127 .. 127).include? n
        return [0x81, n & 0xff]
      elsif (-32767 .. 32767).include? n
        return [0x82, n & 0xff, (n >> 8) & 0xff]
      end
      [0x83, n & 0xff, (n >> 8) & 0xff, (n >> 16) & 0xff, (n >> 24) & 0xff]
    end

    # @return [ByteString]
    def param_simple(x)
      case x
      when Integer
        make_lc(x).map(&:chr).join("")
      when String
        u8(0x80) + x + u8(0x00)
      else
        raise ArgumentError, "Unexpected type: #{x.class}"
      end
    end
  end

  class SysOp
    include Bytes
    # FIXME: also declare the out arguments
    def list_files(buf_size, filename)
      u8(0x99) + u16(buf_size) + filename + u8(0)
    end
  end
end
