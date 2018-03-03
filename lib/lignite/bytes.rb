module Lignite
  # Shortcut methods to convert between data and their byte representation
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

    def unpack_f32(s)
      s.unpack("e").first
    end

    # @param hex [String] "413432"
    # @return [ByteString] "A42"
    def hex_to_bin(hex)
      [hex].pack("H*")
    end

    # @param bin [ByteString] "A42"
    # @return [String] "413432"
    def bin_to_hex(bin)
      bin.unpack("H*").first
    end
  end
end
