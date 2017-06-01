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

#    op :sound, 0x94 do
#      subop :break, 0 # param: []
#      subop :tone, 1, param: [
#              input(:par8, :volume),
#              input(:par16, :frequency),
#              input(:par16, :duration)
#            ]
#
#    end

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
