#!/usr/bin/ruby
require "lignite"

dc = Lignite::DirectCommands.new

# see 28/31 of Comm dev kit, read light sensor value on port 3
LAYER0 = 0
MODE = 0
count = 1
pct = dc.with_reply do
  # global vars
  dataf :light

  # TODO: make the block optional if there are no locals. or #with_locals
  block do
    input_device_ready_si(LAYER0, Lignite::PORT_3, Lignite::TYPE_KEEP, MODE, count, :light)
  end
end
puts "Light sensor percentage: #{pct}"
