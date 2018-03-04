module Lignite
  # Allocate local or global variables
  # FIXME: the user can make bad alignment, resulting in VMError at runtime
  # bad:  data8 :speed; data32 :tacho; output_read(...)
  # good  data32 :tacho; data8 :speed; output_read(...)
  class Variables
    include Bytes

    def initialize
      @offset = 0
      # for proper decoding of direct replies according to declared types
      @unpacker = ""
      @vars = {}
      @param_count = 0
      @param_decl_bytes = ""
    end

    # declare
    def add(id, size, unpacker)
      raise "Duplicate variable #{id}" if @vars.key?(id)
      @vars[id] = { offset: @offset, size: size }
      @offset += size
      @unpacker += unpacker
    end

    # declare a subroutine parameter
    def param(name, size, size_code, direction)
      raise "Duplicate parameter #{name}" if @vars.key?(name)
      nonsense_unpacker = "," # FIXME: better
      add(name, size, nonsense_unpacker)

      @param_count += 1
      @param_decl_bytes += u8(size_code | direction)
    end

    # use
    def key?(sym)
      @vars.key?(sym)
    end

    # use
    def offset(sym)
      @vars[sym][:offset]
    end

    # compile
    def bytesize
      @offset
    end

    def param_decl_header
      u8(@param_count) + @param_decl_bytes
    end

    # decode reply
    def unpack(buf)
      values = buf.unpack(@unpacker)
      values.size == 1 ? values.first : values
    end
  end

  # `variables` are {Variables}
  module VariableDeclarer
    def data8(id)
      variables.add(id, 1, "C")
    end

    def data16(id)
      variables.add(id, 2, "S<")
    end

    def data32(id)
      variables.add(id, 4, "L<")
    end

    def dataf(id)
      variables.add(id, 4, "e")
    end

    def datas(id, size)
      variables.add(id, size, "a#{size}")
    end

    def array8(id, count)
      variables.add(id, count * 1, "C#{count}")
    end
  end
end
