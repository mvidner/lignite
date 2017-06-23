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
end
