#!/usr/bin/ruby
require "lignite"

dc = Lignite::DirectCommands.new

dc.ui_write_led(Lignite::LED_RED_FLASH)
sleep 3
dc.ui_write_led(Lignite::LED_ORANGE_PULSE)
sleep 3
dc.ui_write_led(Lignite::LED_GREEN)
