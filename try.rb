#!/usr/bin/ruby
$: << "lib"

require "ev3"

class MessageSender
  include Ev3::Bytes

  def initialize(connection)
    @c = connection
    @msg_counter = 0
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
    lenbuf = bufread(2)
    size = unpack_u16(lenbuf)

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

c = Ev3::UsbConnection.new

ms = MessageSender.new(c)

Ev3::Op.load_yml
op = Ev3::Op.new

sysop = Ev3::SysOp.new
sinsb = sysop.list_files(9999, "/home/root/lms2012/prjs/")

# fixme this also prints the 4 byte length and 1 byte handle
print ms.system_command_with_reply(sinsb)

insb = op.sound_tone(2, 880, 500)
ms.direct_command(insb)

insb = op.ui_draw_clean
ms.direct_command(insb)
insb = op.ui_draw_text(1, 20, 40, "Hello, world!")
ms.direct_command(insb)
insb = op.ui_draw_update
ms.direct_command(insb)

layer = 0
nos = Ev3::PORT_B
speed = 100
step_begin = 0
step_do = 360
step_end = 0
brake = 1
insb = op.output_step_speed(layer, nos, speed,
                            step_begin, step_do, step_end, brake)
ms.direct_command(insb)
