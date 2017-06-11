module Ev3
  module Bytes
    def u8(n)
      (n & 0xff).chr
    end

    def u16(n)
      u8(n & 0xff) + u8(n >> 8)
    end

    def u32(n)
      u16(n & 0xffff) + u16(n >> 16)
    end

    def f32(float)
      [float].pack("e")
    end

    def unpack_u8(s)
      s.unpack("C").first
    end

    def unpack_u16(s)
      s.unpack("S<").first
    end

    def unpack_u32(s)
      s.unpack("L<").first
    end
  end
end
