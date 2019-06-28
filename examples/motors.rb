#!/usr/bin/ruby
# typed: false
require "lignite"

dc = Lignite::DirectCommands.new

layer = 0
nos = Lignite::PORT_B | Lignite::PORT_C
speed = 100
step_begin = 0
step_do = 360
step_end = 0
brake = Lignite::COAST
dc.output_step_speed(layer, nos, speed,
                     step_begin, step_do, step_end, brake)
dc.output_ready(layer, nos)

speed = -100
m = Lignite::Motors.new(layer, nos, dc)
m.step_speed(speed, step_begin, step_do, step_end)
