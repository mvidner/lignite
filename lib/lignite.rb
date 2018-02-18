require "lignite/bytes"
require "lignite/logger"

require "lignite/assembler"
require "lignite/body_compiler"
require "lignite/connection"
require "lignite/connection/bluetooth"
require "lignite/connection/usb"
require "lignite/direct_commands"
require "lignite/message"
require "lignite/message_sender"
require "lignite/op_compiler"
require "lignite/rbf_object"
require "lignite/system_commands"
require "lignite/variables"

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
