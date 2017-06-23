# https://github.com/larskanis/libusb
require "libusb"

module Lignite
  class NoUsbDevice < RuntimeError
  end

  class UsbConnection
    include Logger

    # To get to the endpoint we need to descend down the hierarchy of
    # 1. Device
    VENDOR_LEGO = 0x0694
    PRODUCT_EV3 = 5
    # 2. Configuration 
    CONFIGURATION_EV3 = 1         # 1-based
    # 3. Interface
    INTERFACE_EV3 = 0             # 0-based
    # 4. Alternate setting
    SETTING_EV3 = 0               # 0-based
    # 5. Endpoint
    ENDPOINT_EV3 = 1              # 0-based

    attr_reader :device, :interface, :out_ep, :in_ep

    def initialize
      usb = LIBUSB::Context.new
      @device = usb.devices(idVendor: VENDOR_LEGO, idProduct: PRODUCT_EV3).first
      raise Lignite::NoUsbDevice if @device.nil?

      ## Because multiple configs are rare, the library allows to omit this:
      ## device.set_configuration(CONFIGURATION_EV3)
      @interface = @device.interfaces[INTERFACE_EV3]
      eps = @interface.endpoints
      @out_ep = eps.find { |e| e.direction == :out}
      @in_ep = eps.find { |e| e.direction == :in}
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
            if e.transferred.is_a? String
              got = e.transferred
            else
              raise
            end
          end
        end
      end
      logger.debug "Read returning #{got.bytesize} bytes"
      got
    end
  end
end
