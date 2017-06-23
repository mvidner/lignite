module Lignite
  class Assembler
    include Bytes
    include Logger

    SIGNATURE = "LEGO"
    def image_header(image_size:, version:, object_count:, global_bytes:)
      SIGNATURE + u32(image_size) + u16(version) + u16(object_count) +
        u32(global_bytes)
    end

    def assemble(rb_filename, rbf_filename)
      rb_text = File.read(rb_filename)
      @objects = []
      @global_bytes = 0

      instance_eval(rb_text, rb_filename, 1)

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
                              version: 109,
                              object_count: @objects.size,
                              global_bytes: @global_bytes)
        f.write(header)
      end
    end

    def vmthread(id, &body)
      @locals = Variables.new
      bodyc = BodyCompiler.new(@locals)
      bodyc.instance_exec(&body)
      bodyc.instance_exec { object_end }
      logger.debug "VMTHREAD #{id}"
      logger.debug "  size #{bodyc.bytes.bytesize}"
      logger.debug "  " + hexdump(bodyc.bytes)
      @objects << RbfObject.vmthread(body: bodyc.bytes, local_bytes: @locals.bytesize)
    end
  end
end
