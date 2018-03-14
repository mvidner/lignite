require "lignite/bytes"
require "lignite/logger"

require "lignite/assembler"
require "lignite/body_compiler"
require "lignite/connection"
require "lignite/connection/bluetooth"
require "lignite/connection/replay"
require "lignite/connection/tap"
require "lignite/connection/usb"
require "lignite/direct_commands"
require "lignite/message"
require "lignite/motors"
require "lignite/op_compiler"
require "lignite/rbf_object"
require "lignite/system_commands"
require "lignite/variables"
require "lignite/version"

module Lignite
  LAYER_0 = 0

  PORT_A = 1
  PORT_B = 2
  PORT_C = 4
  PORT_D = 8

  PORT_1 = 0
  PORT_2 = 1
  PORT_3 = 2
  PORT_4 = 3

  COAST = 0
  BRAKE = 1

  # A String of bytes (with Encoding::BINARY)
  class ByteString < String
    # empty class, just for documentation purposes
  end

  # Represents an error returned by the robot
  class VMError < RuntimeError
  end
end
