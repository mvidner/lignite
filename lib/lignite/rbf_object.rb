module Lignite
  # Part of an assembled RBF file
  class RbfObject
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
end
