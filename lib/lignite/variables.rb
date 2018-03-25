module Lignite
  # Allocate local or global variables
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

    # Declare a variable/parameter *id*
    # @param id [Symbol]
    # @param size [Integer] byte size of one element of the data
    # @param count [Integer] 1 for scalars, more for arrays
    # @param unpacker [String] for String#unpack for direct commands
    def add(id, size, count, unpacker)
      raise "Duplicate variable #{id}" if @vars.key?(id)
      @offset = align(@offset, size)
      @vars[id] = { offset: @offset, size: size * count }
      @offset += size * count
      @unpacker += unpacker
    end

    # declare a subroutine parameter
    def param(name, size, count, size_code, direction)
      raise "Duplicate parameter #{name}" if @vars.key?(name)
      unless @offset == align(@offset, size)
        raise "Misaligned parameter #{name} of size #{size} at #{@offset}"
      end
      nonsense_unpacker = "," # FIXME: better
      add(name, size, count, nonsense_unpacker)

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

    private

    # Round *n* up to a next multiple of *size*
    def align(n, size)
      (n + size - 1).div(size) * size
    end
  end

  # `variables` are {Variables}
  module VariableDeclarer
    def data8(id)
      variables.add(id, 1, 1, "C")
    end

    def data16(id)
      variables.add(id, 2, 1, "S<")
    end

    def data32(id)
      variables.add(id, 4, 1, "L<")
    end

    def dataf(id)
      variables.add(id, 4, 1, "e")
    end

    def datas(id, size)
      variables.add(id, 1, size, "a#{size}")
    end

    def array8(id, count)
      variables.add(id, 1, count, "C#{count}")
    end
  end
end
