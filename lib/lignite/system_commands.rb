module Lignite
  class SystemCommands
    include Bytes
    include Logger
    extend Logger

    def self.run(conn = Connection.create, &block)
      sc = new(conn)
      sc.instance_exec(&block)
      sc.close
    end

    # @param conn [Connection]
    def initialize(conn = Connection.create)
      @conn = conn
      load_yml
    end

    def close
      @conn.close
    end

    private

    def load_yml
      fname = File.expand_path("../../../data/sysops.yml", __FILE__)
      op_hash = YAML.load_file(fname)["sysops"]
      op_hash.each do |oname, odata|
        load_op(oname, odata)
      end
    end

    # oname LIST_FILES
    def load_op(oname, odata)
      ovalue = odata["value"]

      param_handlers, return_handlers = handlers(odata)

      osym = oname.downcase.to_sym
      self.class.send(:define_method, osym) do |*args|
        logger.debug "called #{osym} with #{args.inspect}"
        if args.size != param_handlers.size
          raise ArgumentError, "expected #{param_handlers.size} arguments, got #{args.size}"
        end

        bytes = u8(ovalue)
        bytes += param_handlers.zip(args).map do |h, a|
          # h.call(a) would have self = Op instead of #<Op>
          instance_exec(a, &h)
        end.join("")
        logger.debug "sysop to execute: #{bytes.inspect}"

        reply = system_command_with_reply(bytes)

        # TODO: parse it with return_handlers
        replies = return_handlers.map do |h|
          parsed, reply = h.call(reply)
          parsed
        end
        raise "Unparsed reply #{reply.inspect}" unless reply.empty?
        # A single reply is returned as a scalar, not an array
        replies.size == 1 ? replies.first : replies
      end
    end

    def handlers(odata)
      oparams = odata["params"]
      param_handlers = []
      return_handlers = []
      oparams.each do |p|
        if p["dir"] == "in"
          param_handlers << param_handler(p)
        else
          return_handlers << return_handler(p)
        end
      end
      [param_handlers, return_handlers]
    end

    def param_handler(oparam)
      case oparam["type"]
      when "U8"
        ->(x) { u8(x) }
      when "U16"
        ->(x) { u16(x) }
      when "U32"
        ->(x) { u32(x) }
      when "BYTES"
        ->(x) { x }
      when "ZBYTES"
        ->(x) { x + u8(0) }
      else
        raise
      end
    end

    # the handler is a lambda returning a pair:
    # a parsed value and the rest of the input
    def return_handler(oparam)
      case oparam["type"]
      when "U8"
        ->(i) { [unpack_u8(i[0, 1]), i[1..-1]] }
      when "U16"
        ->(i) { [unpack_u16(i[0, 2]), i[2..-1]] }
      when "U32"
        ->(i) { [unpack_u32(i[0, 4]), i[4..-1]] }
      when "BYTES"
        ->(i) { [i, ""] }
      else
        raise
      end
    end

    def system_command_with_reply(instr_bytes)
      cmd = Message.system_command_with_reply(instr_bytes)
      @conn.send(cmd.bytes)

      reply = Message.reply_from_bytes(@conn.receive)
      assert_match(reply.msgid, cmd.msgid, "Reply id")
      assert_match(reply.command, unpack_u8(instr_bytes[0]), "Command num")
      raise VMError, format("Error: %u", reply.status) if reply.error?

      reply.data
    end

    def assert_match(actual, expected, description)
      return if actual == expected
      raise "#{description} does not match, expected #{expected}, actual #{actual}"
    end
  end
end
