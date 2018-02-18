#!/usr/bin/ruby
require "lignite"

dc = Lignite::DirectCommands.new

dc.sound_tone(50, 880, 200)
dc.sound_ready
dc.sound_tone(50, 1760, 400)
dc.sound_ready
