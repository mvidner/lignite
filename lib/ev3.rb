require "ev3/bytes"

require "ev3/assembler"
require "ev3/direct_commands"
require "ev3/message_sender"
require "ev3/op_compiler"
require "ev3/sysop_compiler"
require "ev3/usb_connection"

module Ev3
  PORT_A = 1
  PORT_B = 2
  PORT_C = 4
  PORT_D = 8

  # A String of bytes (with Encoding::BINARY)
  class ByteString < String
    # empty class, just for documentation purposes
  end
end
