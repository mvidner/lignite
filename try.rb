#!/usr/bin/ruby
$: << "lib"

require "ev3"

conn = Ev3::UsbConnection.new
dc = Ev3::DirectCommands.new(conn)

soc = Ev3::SysOpCompiler.new
sinsb = soc.list_files(9999, "/home/root/lms2012/prjs/")
ms = Ev3::MessageSender.new(conn)
# fixme this also prints the 4 byte length and 1 byte handle
print ms.system_command_with_reply(sinsb)

dc.sound_tone(2, 880, 500)

dc.ui_draw_clean
dc.ui_draw_text(1, 20, 40, "Hello, world!")
dc.ui_draw_value(1, 20, 80, Math::PI, 6, 4)
dc.ui_draw_update

layer = 0
nos = Ev3::PORT_B
speed = 100
step_begin = 0
step_do = 180
step_end = 0
brake = 1
dc.output_step_speed(layer, nos, speed,
                     step_begin, step_do, step_end, brake)
