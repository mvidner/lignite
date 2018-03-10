#!/usr/bin/ruby
require "lignite"

dc = Lignite::DirectCommands.new

# Read gyro sensor angle on port 2
LAYER0 = 0
MODE = 0
pct = dc.with_reply do
  # global vars
  dataf :angle

  block do
    input_device_ready_si(LAYER0, Lignite::PORT_2, Lignite::TYPE_GYRO, MODE, :angle)
  end
end
puts "Gyro sensor angle: #{pct}"

dc.close
