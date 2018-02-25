module Lignite
  # Allocate local or global variables
  class Variables
    def initialize
      @offset = 0
      @vars = {}
    end

    def add(id, size)
      raise "Duplicate variable #{id}" if @vars.key?(id)
      @vars[id] = {offset: @offset, size: size}
      @offset += size
    end

    def bytesize
      @offset
    end

    def key?(sym)
      @vars.key?(sym)
    end

    def offset(sym)
      @vars[sym][:offset]
    end
  end

  # {#variables} are {Variables}
  module VariableDeclarer
    def data8(id)
      variables.add(id, 1)
    end

    def data16(id)
      variables.add(id, 2)
    end

    def data32(id)
      variables.add(id, 4)
    end

    def dataf(id)
      variables.add(id, 4)
    end

    def datas(id, size)
      variables.add(id, size)
    end

    def array8(id, count)
      variables.add(id, count * 1)
    end
  end
end
