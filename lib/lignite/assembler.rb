require "lignite/variables"

module Lignite
  # Assemble a complete RBF program file.
  class Assembler
    include Bytes
    include Logger

    SIGNATURE = "LEGO"
    def image_header(image_size:, version:, object_count:, global_bytes:)
      SIGNATURE + u32(image_size) + u16(version) + u16(object_count) +
        u32(global_bytes)
    end

    # @return [Array<RbfObject>]
    attr :objects
    # @return [Variables]
    attr :globals

    # Assemble a complete RBF program file.
    # (it is OK to reuse an Assembler and call this several times in a sequence)
    # TODO: redesign for Assembler.new(rb_filename).assemble(rbf_filename)?
    # @param rb_filename [String] input
    # @param rbf_filename [String] output
    def assemble(rb_filename, rbf_filename, version: 109)
      rb_text = File.read(rb_filename)
      @objects = []
      @globals = Variables.new

      instance_eval(rb_text, rb_filename, 1) # 1 is the line number

      File.open(rbf_filename, "w") do |f|
        dummy_header = image_header(image_size:0, version: 0, object_count: 0, global_bytes: 0)
        f.write(dummy_header)
        @objects.each do |obj|
          h = obj.header(f.tell)
          f.write(h)
          f.write(obj.body)
          # align??
        end
        size = f.tell
        f.pos = 0
        header = image_header(image_size: size,
                              version: version,
                              object_count: @objects.size,
                              global_bytes: @globals.bytesize)
        f.write(header)
      end
    end

    def variables
      globals
    end
    include VariableDeclarer

    def vmthread(id, &body)
      @locals = Variables.new
      bodyc = BodyCompiler.new(@globals, @locals)
      bodyc.instance_exec(&body)
      bodyc.instance_exec { object_end }
      # FIXME: id is not written?!
      logger.debug "VMTHREAD #{id}"
      logger.debug "  size #{bodyc.bytes.bytesize}"
      logger.debug "  " + hexdump(bodyc.bytes)
      @objects << RbfObject.vmthread(body: bodyc.bytes, local_bytes: @locals.bytesize)
    end
  end
end
