module Lignite

  # FIXME: Possibly merge with Connection (UsbConnection)
  class MessageSender
    include Lignite::Bytes

    def initialize(connection)
      @c = connection
      @msg_counter = rand 65536
      @buf = ""
    end

    def msgid
      @msg_counter += 1
      puts "MSGID #{@msg_counter}"
      @msg_counter
    end

    def send(payload)
      packet = u16(payload.bytesize) + payload
      print "-> "
      p packet
      @c.write(packet)
    end

    # read must not be called with a too low value :-/
    def bufread(n)
      while n > @buf.bytesize
        @buf += @c.read(10000)
      end
      ret = @buf[0, n]
      @buf = @buf[n..-1]
      print "R<-(#{ret.bytesize})"
      p ret
      ret
    end

    def receive
      size = nil
      loop do
        lenbuf = bufread(2)
        size = unpack_u16(lenbuf)
        break unless size.zero?
        # leftover data?
        @buf = ""
      end

      res = bufread(size)
      res
    end

    def direct_command(instr_bytes, var_alloc: 0)
      cmd_type = 0x80
      bytes = u16(msgid) + u8(cmd_type) + u16(var_alloc) +
              instr_bytes
      send(bytes)
    end

    def direct_command_with_reply(instr_bytes, var_alloc: 0)
      cmd_type = 0x00
      bytes = u16(msgid) + u8(cmd_type) + u16(var_alloc) +
              instr_bytes
      send(bytes)

      reply = receive
      reply
    end

    def extract_id(data)
      [unpack_u16(data[0..1]), data[2..-1]]
    end

    def system_command_with_reply(instr_bytes)
      cmd_id = msgid
      cmd_type = 0x01

      bytes = u16(cmd_id) + u8(cmd_type) + instr_bytes

      send(bytes)
      reply = receive

      id, reply2 = extract_id(reply)
      raise "Bad system reply id, #{id} != #{cmd_id}" unless id == cmd_id

      rep_type   = reply2[0].ord # 03 sysreply, 05 syserror
      rep_cmd    = reply2[1].ord
      rep_status = reply2[2].ord
      raise "Bad system reply cmd, #{rep_cmd} != #{instr_bytes[0].ord}" unless rep_cmd == instr_bytes[0].ord
      if rep_type == 0x05
        raise "VMError, %u" % rep_status
      end
      payload = reply2[3..-1]
      payload
    end
  end
end
