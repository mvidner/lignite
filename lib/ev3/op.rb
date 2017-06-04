require "yaml"

module Ev3
  module Bytes
    def u8(n)
      (n & 0xff).chr
    end

    def u16(n)
      u8(n & 0xff) + u8(n >> 8)
    end

    def unpack_u16(s)
      s.unpack("S<").first
    end
  end

  class Op
    include Bytes

    class TODO < StandardError
    end

    def self.load_op(oname, odata)
      osym = oname.downcase.to_sym
      ovalue = odata["value"]
      oparams = odata["params"]
      oparams.each do |par|
        case par["type"]
        when "SUBP"
          raise TODO
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
          # we can do this with primpar
        end
      end

      define_method(osym) do |*args|
        puts "called #{osym} with #{args.inspect}"
        bytes = u8(ovalue)
        # assuming all args can behandled with primpar
        bytes += args.map { |a| primpar(a) }.join("")
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

    # a manual definition with a trailing _
    def output_step_speed_(layer, nos, speed,
                          step_begin, step_do, step_end, brake)
      u8(0xae) + \
            primpar(layer) + \
            primpar(nos) + \
            primpar(speed) + \
            primpar(step_begin) + \
            primpar(step_do) + \
            primpar(step_end) + \
            primpar(brake)
    end

    def sound_tone(volume, frequency, duration_ms)
      u8(0x94) + primpar(1) + \
            primpar(volume) + \
            primpar(frequency) + \
            primpar(duration_ms)
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

    def primpar(x)
      case x
      when Integer
        make_lc(x).map(&:chr).join("")
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
