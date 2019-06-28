# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/libusb-0.6.4-x86_64/all/libusb-0.6.4-x86_64.rbi
#
# libusb-0.6.4-x86_64-linux
module LIBUSB
  def self.dev_string(base_class, sub_class, protocol); end
  def self.has_capability?(capability); end
  def self.raise_error(res, text); end
  def self.version; end
end
module LIBUSB::Call
  def libusb_alloc_streams(*arg0); end
  def libusb_alloc_transfer(*arg0); end
  def libusb_attach_kernel_driver(*arg0); end
  def libusb_cancel_transfer(*arg0); end
  def libusb_claim_interface(*arg0); end
  def libusb_clear_halt(*arg0); end
  def libusb_close(*arg0); end
  def libusb_detach_kernel_driver(*arg0); end
  def libusb_dev_mem_alloc(*arg0); end
  def libusb_dev_mem_free(*arg0); end
  def libusb_exit(*arg0); end
  def libusb_free_bos_descriptor(*arg0); end
  def libusb_free_config_descriptor(*arg0); end
  def libusb_free_container_id_descriptor(*arg0); end
  def libusb_free_device_list(*arg0); end
  def libusb_free_pollfds(*arg0); end
  def libusb_free_ss_endpoint_companion_descriptor(*arg0); end
  def libusb_free_ss_usb_device_capability_descriptor(*arg0); end
  def libusb_free_streams(*arg0); end
  def libusb_free_transfer(*arg0); end
  def libusb_free_usb_2_0_extension_descriptor(*arg0); end
  def libusb_get_active_config_descriptor(*arg0); end
  def libusb_get_bos_descriptor(*arg0); end
  def libusb_get_bus_number(*arg0); end
  def libusb_get_config_descriptor(*arg0); end
  def libusb_get_config_descriptor_by_value(*arg0); end
  def libusb_get_container_id_descriptor(*arg0); end
  def libusb_get_device(*arg0); end
  def libusb_get_device_address(*arg0); end
  def libusb_get_device_descriptor(*arg0); end
  def libusb_get_device_list(*arg0); end
  def libusb_get_device_speed(*arg0); end
  def libusb_get_max_iso_packet_size(*arg0); end
  def libusb_get_max_packet_size(*arg0); end
  def libusb_get_next_timeout(*arg0); end
  def libusb_get_parent(*arg0); end
  def libusb_get_pollfds(*arg0); end
  def libusb_get_port_number(*arg0); end
  def libusb_get_port_numbers(*arg0); end
  def libusb_get_port_path(*arg0); end
  def libusb_get_ss_endpoint_companion_descriptor(*arg0); end
  def libusb_get_ss_usb_device_capability_descriptor(*arg0); end
  def libusb_get_string_descriptor_ascii(*arg0); end
  def libusb_get_usb_2_0_extension_descriptor(*arg0); end
  def libusb_get_version(*arg0); end
  def libusb_handle_events(*arg0); end
  def libusb_handle_events_completed(*arg0); end
  def libusb_handle_events_timeout(*arg0); end
  def libusb_handle_events_timeout_completed(*arg0); end
  def libusb_has_capability(*arg0); end
  def libusb_hotplug_deregister_callback(*arg0); end
  def libusb_hotplug_register_callback(*arg0); end
  def libusb_init(*arg0); end
  def libusb_interrupt_event_handler(*arg0); end
  def libusb_kernel_driver_active(*arg0); end
  def libusb_open(*arg0); end
  def libusb_open_device_with_vid_pid(*arg0); end
  def libusb_ref_device(*arg0); end
  def libusb_release_interface(*arg0); end
  def libusb_reset_device(*arg0); end
  def libusb_set_auto_detach_kernel_driver(*arg0); end
  def libusb_set_configuration(*arg0); end
  def libusb_set_debug(*arg0); end
  def libusb_set_interface_alt_setting(*arg0); end
  def libusb_set_option(*args); end
  def libusb_set_pollfd_notifiers(*arg0); end
  def libusb_submit_transfer(*arg0); end
  def libusb_transfer_get_stream_id(*arg0); end
  def libusb_transfer_set_stream_id(*arg0); end
  def libusb_unref_device(*arg0); end
  def self.libusb_alloc_streams(*arg0); end
  def self.libusb_alloc_transfer(*arg0); end
  def self.libusb_attach_kernel_driver(*arg0); end
  def self.libusb_cancel_transfer(*arg0); end
  def self.libusb_claim_interface(*arg0); end
  def self.libusb_clear_halt(*arg0); end
  def self.libusb_close(*arg0); end
  def self.libusb_detach_kernel_driver(*arg0); end
  def self.libusb_dev_mem_alloc(*arg0); end
  def self.libusb_dev_mem_free(*arg0); end
  def self.libusb_exit(*arg0); end
  def self.libusb_free_bos_descriptor(*arg0); end
  def self.libusb_free_config_descriptor(*arg0); end
  def self.libusb_free_container_id_descriptor(*arg0); end
  def self.libusb_free_device_list(*arg0); end
  def self.libusb_free_pollfds(*arg0); end
  def self.libusb_free_ss_endpoint_companion_descriptor(*arg0); end
  def self.libusb_free_ss_usb_device_capability_descriptor(*arg0); end
  def self.libusb_free_streams(*arg0); end
  def self.libusb_free_transfer(*arg0); end
  def self.libusb_free_usb_2_0_extension_descriptor(*arg0); end
  def self.libusb_get_active_config_descriptor(*arg0); end
  def self.libusb_get_bos_descriptor(*arg0); end
  def self.libusb_get_bus_number(*arg0); end
  def self.libusb_get_config_descriptor(*arg0); end
  def self.libusb_get_config_descriptor_by_value(*arg0); end
  def self.libusb_get_container_id_descriptor(*arg0); end
  def self.libusb_get_device(*arg0); end
  def self.libusb_get_device_address(*arg0); end
  def self.libusb_get_device_descriptor(*arg0); end
  def self.libusb_get_device_list(*arg0); end
  def self.libusb_get_device_speed(*arg0); end
  def self.libusb_get_max_iso_packet_size(*arg0); end
  def self.libusb_get_max_packet_size(*arg0); end
  def self.libusb_get_next_timeout(*arg0); end
  def self.libusb_get_parent(*arg0); end
  def self.libusb_get_pollfds(*arg0); end
  def self.libusb_get_port_number(*arg0); end
  def self.libusb_get_port_numbers(*arg0); end
  def self.libusb_get_port_path(*arg0); end
  def self.libusb_get_ss_endpoint_companion_descriptor(*arg0); end
  def self.libusb_get_ss_usb_device_capability_descriptor(*arg0); end
  def self.libusb_get_string_descriptor_ascii(*arg0); end
  def self.libusb_get_usb_2_0_extension_descriptor(*arg0); end
  def self.libusb_get_version(*arg0); end
  def self.libusb_handle_events(*arg0); end
  def self.libusb_handle_events_completed(*arg0); end
  def self.libusb_handle_events_timeout(*arg0); end
  def self.libusb_handle_events_timeout_completed(*arg0); end
  def self.libusb_has_capability(*arg0); end
  def self.libusb_hotplug_deregister_callback(*arg0); end
  def self.libusb_hotplug_register_callback(*arg0); end
  def self.libusb_init(*arg0); end
  def self.libusb_interrupt_event_handler(*arg0); end
  def self.libusb_kernel_driver_active(*arg0); end
  def self.libusb_open(*arg0); end
  def self.libusb_open_device_with_vid_pid(*arg0); end
  def self.libusb_ref_device(*arg0); end
  def self.libusb_release_interface(*arg0); end
  def self.libusb_reset_device(*arg0); end
  def self.libusb_set_auto_detach_kernel_driver(*arg0); end
  def self.libusb_set_configuration(*arg0); end
  def self.libusb_set_debug(*arg0); end
  def self.libusb_set_interface_alt_setting(*arg0); end
  def self.libusb_set_option(*args); end
  def self.libusb_set_pollfd_notifiers(*arg0); end
  def self.libusb_submit_transfer(*arg0); end
  def self.libusb_transfer_get_stream_id(*arg0); end
  def self.libusb_transfer_set_stream_id(*arg0); end
  def self.libusb_unref_device(*arg0); end
  def self.try_attach_function(method, *args); end
  extend FFI::Library
end
class LIBUSB::Call::IsoPacketDescriptor < FFI::Struct
end
class LIBUSB::Call::ControlSetup < FFI::Struct
end
class LIBUSB::Call::Transfer < FFI::ManagedStruct
  def self.release(ptr); end
end
class LIBUSB::Call::DeviceDescriptor < FFI::Struct
  include Comparable
end
class LIBUSB::Call::Timeval < FFI::Struct
  def in_ms; end
  def in_ms=(value); end
  def in_s; end
  def in_s=(value); end
end
class LIBUSB::Call::Pollfd < FFI::Struct
end
class LIBUSB::Error < RuntimeError
  def initialize(msg = nil, transferred = nil); end
  def transferred; end
end
class LIBUSB::SUCCESS < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_IO < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_INVALID_PARAM < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_ACCESS < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_NO_DEVICE < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_NOT_FOUND < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_BUSY < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_TIMEOUT < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_OVERFLOW < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_PIPE < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_INTERRUPTED < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_NO_MEM < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_NOT_SUPPORTED < LIBUSB::Error
  def code; end
end
class LIBUSB::ERROR_OTHER < LIBUSB::Error
  def code; end
end
class LIBUSB::Context
  def debug=(level); end
  def device_list; end
  def devices(filter_hash = nil); end
  def exit; end
  def expect_option_args(exp, is); end
  def handle_events(timeout = nil, completion_flag = nil); end
  def initialize; end
  def interrupt_event_handler; end
  def next_timeout; end
  def on_hotplug_event(args = nil, &block); end
  def on_pollfd_added(&block); end
  def on_pollfd_removed(&block); end
  def pollfds; end
  def set_option(option, *args); end
end
class LIBUSB::Context::Pollfd
  def <=>(other); end
  def events; end
  def fd; end
  def initialize(fd, events = nil); end
  def inspect; end
  def io; end
  def pollin?; end
  def pollout?; end
  include Comparable
end
class LIBUSB::Context::CompletionFlag < FFI::Struct
  def completed=(flag); end
  def completed?; end
end
class LIBUSB::Context::HotplugCallback < FFI::Struct
  def context; end
  def deregister; end
  def initialize(context, ctx, callbacks); end
end