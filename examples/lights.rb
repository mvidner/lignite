#!/usr/bin/ruby
require "lignite"

Lignite::DirectCommands.run do |dc|
  ui_write_led(Lignite::LED_RED_FLASH)
  sleep 3
  ui_write_led(Lignite::LED_ORANGE_PULSE)
  sleep 3
  ui_write_led(Lignite::LED_GREEN)
end
