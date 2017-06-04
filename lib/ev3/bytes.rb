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
end
