require "lignite/rbf_declarer"
require "lignite/variables"

module Lignite
  # Assemble a complete RBF program file.
  #
  # The compilation has two passes:
  #
  # 1. pass1, Declaration
  # 2. pass2, Resolution
  #
  # After P1, the instruction sequence is iterated. If an item responds to
  # :pass2, it is replaced by the result of that call.
  # After pass2 we have a sequence of ByteStrings which are just concatenated
  #
  # No, pass1, gather names, pass2 do all the rest
  class Assembler
    include Bytes
    include Logger
    include Lignite # for constants

    HEADER_SIZE = 16
    SIGNATURE = "LEGO".freeze
    def image_header(image_size:, version:, object_count:, global_bytes:)
      SIGNATURE + u32(image_size) + u16(version) + u16(object_count) +
        u32(global_bytes)
    end

    # @return [Array<RbfObject>]
    attr_accessor :objects
    # @return [Variables]
    attr_accessor :globals

    def initialize
      @objects = []
      @globals = Variables.new
    end

    # Assemble a complete RBF program file.
    # (it is OK to reuse an Assembler and call this several times in a sequence)
    # TODO: redesign for Assembler.new(rb_filename).assemble(rbf_filename)?
    # @param rb_filename [String] input
    # @param rbf_filename [String] output
    def assemble(rb_filename, rbf_filename, version: 109)
      initialize
      rb_text = File.read(rb_filename)

      @declarer = RbfDeclarer.new
      @declarer.instance_eval(rb_text, rb_filename, 1) # 1 is the line number
      instance_eval(rb_text, rb_filename, 1) # 1 is the line number

      write(rbf_filename, version)
    end

    def compile(&block)
      @declarer = RbfDeclarer.new
      @declarer.instance_exec(&block)
      instance_exec(&block)
    end

    def write(rbf_filename, version = 109)
      image_size = HEADER_SIZE + @objects.map(&:size).reduce(0, :+)

      File.open(rbf_filename, "w") do |f|
        header = image_header(image_size:   image_size,
                              version:      version,
                              object_count: @objects.size,
                              global_bytes: @globals.bytesize)
        f.write(header)

        object_instruction_offset = HEADER_SIZE + @objects.count * RbfObject::HEADER_SIZE
        @objects.each do |obj|
          h = obj.header(object_instruction_offset)
          f.write(h)
          object_instruction_offset += obj.body.bytesize
        end

        @objects.each do |obj|
          f.write(obj.body)
          # align??
        end
      end
    end

    def variables
      globals
    end
    include VariableDeclarer

    def vmthread(name, &body)
      @locals = Variables.new
      bodyc = BodyCompiler.new(@globals, @locals, @declarer)
      bodyc.instance_exec(&body)
      bodyc.instance_exec { object_end }
      logger.debug "VMTHREAD #{name}"
      logger.debug "  size #{bodyc.bytes.bytesize}"
      logger.debug "  " + bin_to_hex(bodyc.bytes)
      @objects << RbfObject.vmthread(body: bodyc.bytes, local_bytes: @locals.bytesize)
    end

    def sub(_name, &body)
      @locals = Variables.new
      bodyc = BodyCompiler.new(@globals, @locals, @declarer)
      bodyc.instance_exec(&body)
      bodyc.instance_exec do
        self.return
        object_end
      end
      @objects << RbfObject.subcall(body:        bodyc.param_decl_header + bodyc.bytes,
                                    local_bytes: @locals.bytesize)
    end
  end

  # Acts like DirectCommands but instead of executing, assembles them to a RBF file
  class SimpleAssembler
    def initialize
      @globals = Variables.new
      @locals = Variables.new
      @declarer = RbfDeclarer::Dummy.new

      @interp = BodyCompiler.new(@globals, @locals, @declarer)
    end

    def write(rbf_filename)
      @interp.object_end
      vmthread = RbfObject.vmthread(body: @interp.bytes, local_bytes: @locals.bytesize)

      asm = Assembler.new
      asm.objects = [vmthread]
      asm.globals = @globals
      asm.write(rbf_filename)
    end

    # Delegate the ops to the {BodyCompiler},
    def method_missing(name, *args, &block)
      super unless @interp.respond_to?(name)

      @interp.public_send(name, *args, &block)
    end

    def respond_to_missing?(name, _include_private)
      @interp.respond_to?(name) || super
    end
  end
end
