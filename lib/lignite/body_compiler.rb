module Lignite
  # Extends {OpCompiler} by
  # - variable declarations: {VariableDeclarer}
  # - high level flow control: {#loop}
  class BodyCompiler

    # {#locals} are {Variables}
    module VariableDeclarer
      def data32(id)
        locals.add(id, 4)
      end

      def datas(id, size)
        locals.add(id, size)
      end
    end

    include VariableDeclarer
    attr_reader :bytes
    attr_reader :locals

    def initialize(locals)
      @bytes = ""
      @locals = locals
      @op_compiler = OpCompiler.new(nil, @locals)
    end

    def loop(&body)
      subc = BodyCompiler.new(@locals)
      subc.instance_exec(&body)
      @bytes << subc.bytes
      # the jump takes up 4 bytes: JR, LC2, LO, HI
      jr(Complex(- (subc.bytes.bytesize + 4), 2))
    end

    # Delegate the ops to the {OpCompiler},
    # but also aggregate the result in @bytes.
    def method_missing(name, *args)
      super unless @op_compiler.respond_to?(name)

      @bytes += @op_compiler.send(name, *args)
    end
  end
end
