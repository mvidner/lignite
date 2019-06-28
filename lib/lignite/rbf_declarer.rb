# typed: true
require "lignite/parameter_declarer"
require "lignite/variables"

module Lignite
  # Implements pass 1, just gathers names
  class RbfDeclarer
    # A dummy {RbfDeclarer} to better report
    # that subroutine calls are not allowed in direct commands
    class Dummy
      def index_of(name)
        raise "Cannot look up #{name.inspect}, subs are not allowed here"
      end
    end

    def initialize
      # @return [Hash{Symbol => Integer}]
      @object_names = {}
      @counter = 0
      @dummy_globals = Variables.new
    end

    def index_of(name)
      @object_names[name]
    end

    def variables
      @dummy_globals
    end
    include VariableDeclarer

    def vmthread(name, &_body)
      add(name)
    end

    def sub(name, &_body)
      add(name)
    end

    private

    # stupid typeless implementation
    def add(name)
      seen = @object_names[name]
      unless seen.nil?
        raise "Name #{name.inspect} already declared with index #{seen}"
      end

      @counter += 1
      @object_names[name] = @counter
    end
  end
end
