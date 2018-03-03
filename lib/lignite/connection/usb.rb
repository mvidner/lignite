# https://github.com/larskanis/libusb
require "libusb"

module Lignite
  # No robot USB device was found
  class NoUsbDevice < RuntimeError
  end

  class Connection
    # A {Connection} over a USB cable
    class Usb < Connection
      include Logger

      # To get to the endpoint we need to descend down the hierarchy of
      # 1) Device
      VENDOR_LEGO = 0x0694
      PRODUCT_EV3 = 5
      # 2) Configuration, 1-based
      CONFIGURATION_EV3 = 1
      # 3) Interface, 0-based
      INTERFACE_EV3 = 0
      # 4) Alternate setting, 0-based
      SETTING_EV3 = 0
      # 5) Endpoint, 0-based
      ENDPOINT_EV3 = 1

      attr_reader :device, :interface, :out_ep, :in_ep

      def initialize
        super
        usb = LIBUSB::Context.new
        @device = usb.devices(idVendor: VENDOR_LEGO, idProduct: PRODUCT_EV3).first
        raise Lignite::NoUsbDevice if @device.nil?

        ## Because multiple configs are rare, the library allows to omit this:
        ## device.set_configuration(CONFIGURATION_EV3)
        @interface = @device.interfaces[INTERFACE_EV3]
        eps = @interface.endpoints
        @out_ep = eps.find { |e| e.direction == :out }
        @in_ep = eps.find { |e| e.direction == :in }
      end

      # @return [Integer] number of bytes written
      def write(data)
        written = nil
        @device.open do |devh|
          devh.auto_detach_kernel_driver = true
          devh.claim_interface(@interface) do
            written = devh.interrupt_transfer(endpoint: @out_ep, dataOut: data)
          end
        end
        written
      end

      # @return [String]
      def read(bytes = nil)
        got = nil
        @device.open do |devh|
          devh.auto_detach_kernel_driver = true
          devh.claim_interface(@interface) do
            begin
              got = devh.interrupt_transfer(endpoint: @in_ep, dataIn: bytes)
            rescue LIBUSB::Error => e
              got = e.transferred
              raise unless got.is_a? String
            end
          end
        end
        logger.debug "Read returning #{got.bytesize} bytes"
        got
      end

      def close
        super
        # do nothing: read and write open and close the handle each time
      end
    end
  end
end
