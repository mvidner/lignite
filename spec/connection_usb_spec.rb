require_relative "spec_helper"
require "lignite"

describe Lignite::Connection::Usb do
  let(:device) do
    instance_double("FakeDevice", interfaces: [interface])
  end
  let(:interface) { double("FakeInterface", endpoints: [in_ep, out_ep]) }
  let(:in_ep) { double("InEndpoint", direction: :in) }
  let(:out_ep) { double("OutEndpoint", direction: :out) }
  let(:dev_handle) { double("FakeDevHandle",
                            :"auto_detach_kernel_driver=" => nil, ) }
  before(:each) do
    usb = instance_double("FakeContext", devices: [device])
    allow(LIBUSB::Context).to receive(:new).and_return(usb)
    allow(dev_handle).to receive(:"auto_detach_kernel_driver=")
    allow(dev_handle).to receive(:claim_interface).and_yield
  end
  
  describe "#write" do
    it "does not crash" do
      data = "hello"
      allow(device).to receive(:open).and_yield(dev_handle)
      allow(dev_handle).to receive(:interrupt_transfer).and_return(data.bytesize)
      expect { subject.write(data) }.to_not raise_error
    end
  end

  describe "#read" do
    it "does not crash" do
      allow(device).to receive(:open).and_yield(dev_handle)
      allow(dev_handle).to receive(:interrupt_transfer).and_return("hello")
      expect(subject.read(1000)).to eq("hello")
    end
  end

  describe "#write" do
    it "does not crash" do
      expect { subject.close }.to_not raise_error
    end
  end
end
