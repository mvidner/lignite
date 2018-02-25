module Lignite
  # Allocate local or global variables
  # FIXME: the user can make bad alignment, resulting in VMError at runtime
  # bad:  data8 :speed; data32 :tacho; output_read(...)
  # good  data32 :tacho; data8 :speed; output_read(...)
  class Variables
    def initialize
      @offset = 0
      # for proper decoding of direct replies according to declared types
      @unpacker = ""
      @vars = {}
    end

    # declare
    def add(id, size, unpacker)
      raise "Duplicate variable #{id}" if @vars.key?(id)
      @vars[id] = {offset: @offset, size: size}
      @offset += size
      @unpacker += unpacker
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

    # decode reply
    def unpack(buf)
      values = buf.unpack(@unpacker)
      values.size == 1 ? values.first : values
    end
  end

  # {#variables} are {Variables}
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
