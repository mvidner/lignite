require "lignite/bytes"
require "lignite/logger"

require "lignite/assembler"
require "lignite/bluetooth_connection"
require "lignite/direct_commands"
require "lignite/message_sender"
require "lignite/op_compiler"
require "lignite/sysop_compiler"
require "lignite/usb_connection"

module Lignite
  PORT_A = 1
  PORT_B = 2
  PORT_C = 4
  PORT_D = 8

  # A String of bytes (with Encoding::BINARY)
  class ByteString < String
    # empty class, just for documentation purposes
  end
end
