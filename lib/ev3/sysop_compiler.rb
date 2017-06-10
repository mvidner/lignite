module Ev3
  class SysOpCompiler
    include Bytes
    # FIXME: also declare the out arguments
    def list_files(buf_size, filename)
      u8(0x99) + u16(buf_size) + filename + u8(0)
    end
  end
end
