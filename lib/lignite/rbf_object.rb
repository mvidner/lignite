module Lignite
  # Part of an assembled RBF file
  class RbfObject
    include Bytes
    # @return [RbfObject] make a Vmthread object
    def self.vmthread(body:, local_bytes:)
      new(owner: 0, triggers: 0, local_bytes: local_bytes, body: body)
    end

    # @return [RbfObject] make a Subcall object
    def self.subcall(body:, local_bytes:)
      new(owner: 0, triggers: 1, local_bytes: local_bytes, body: body)
    end

    # @return [RbfObject] make a Block object
    def self.block(owner:, triggers:, body:)
      new(owner: owner, triggers: triggers, local_bytes: 0, body: body)
    end

    # @return [ByteString] an already assembled body of the object
    attr_reader :body

    def initialize(owner:, triggers:, local_bytes:, body:)
      @owner = owner
      @triggers = triggers
      @local_bytes = local_bytes
      @body = body
    end

    HEADER_SIZE = 12
    def size
      HEADER_SIZE + body.bytesize
    end

    def header(object_instruction_offset)
      u32(object_instruction_offset) +
        u16(@owner) + u16(@triggers) + u32(@local_bytes)
    end
  end
end
