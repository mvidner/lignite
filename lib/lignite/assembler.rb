module Lignite
  class Assembler
    include Bytes

    class Obj
      include Bytes
      def self.vmthread(body:, local_bytes:)
        new(owner: 0, triggers: 0, local_bytes: local_bytes, body: body)
      end

      def self.subcall(body:, local_bytes:)
        new(owner: 0, triggers: 1, local_bytes: local_bytes, body: body)
      end

      def self.block(owner:, triggers:, body:)
        new(owner: owner, triggers: triggers, local_bytes: 0, body: body)
      end

      def initialize(owner:, triggers:, local_bytes:, body:)
        @owner = owner
        @triggers = triggers
        @local_bytes = local_bytes
        @body = body
      end

      def header(pos_before_header = 0)
        u32(pos_before_header + 12) + # size of header
          u16(@owner) + u16(@triggers) + u32(@local_bytes)
      end

      def body
        @body
      end
    end

    def initialize
    end

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

    def vmthread(id, &body)
      puts "VMTHREAD #{id}"
      @locals = Variables.new
      bodyc = BodyCompiler.new(@locals)
      bodyc.extend(VariableDeclarer)
      bodyc.instance_exec(&body)
      bodyc.instance_exec { object_end }
      puts "  size #{bodyc.bytes.bytesize}"
      puts "  " + hexdump(bodyc.bytes)
      @objects << Obj.vmthread(body: bodyc.bytes, local_bytes: @locals.bytesize)
    end

    module VariableDeclarer
      def data32(id)
        @locals.add(id, 4)
      end

      def datas(id, size)
        @locals.add(id, size)
      end
    end

    class BodyCompiler
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

      def method_missing(name, *args)
        super unless @op_compiler.respond_to?(name)

        @bytes += @op_compiler.send(name, *args)
      end
    end
  end
end
