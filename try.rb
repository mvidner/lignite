#!/usr/bin/ruby
$: << "lib"

require "ev3"

conn = Ev3::UsbConnection.new
dc = Ev3::DirectCommands.new(conn)

sc = Ev3::SystemCommands.new(conn)
len, h, list = sc.list_files(9999, "/home/root/lms2012/prjs/")
p len
p h
print list

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
