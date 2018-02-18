module Lignite
  class Connection
    # @return [Connection] Try a {Usb} connection first, then a {Bluetooth} one.
    def self.create
      @c ||= begin
               Usb.new
             rescue NoUsbDevice
               Bluetooth.new
             end
    end
    # FIXME: how to close and reopen a connection?
  end
end
