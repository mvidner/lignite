# Lignite: Program LEGO Mindstorms EV3 in Ruby

Lignite is a set of Ruby tools to interact with LEGO Mindstorms EV3.
It uses the original LMS2012 firmware, so ev3dev is not required.

At this point the tools are still rather a thin wrapper so it will be useful
to have the *EV3 Firmware Developer Kit* and *EV3 Communication Developer Kit*
documents at hand for reference: see the "Advanced Users – Developer Kits"
section of the
[Mindstorms Downloads](https://www.lego.com/en-us/mindstorms/downloads) page.

## Features

- Connect via USB or Bluetooth
- Execute Direct Commands
- Execute System Commands, including
    - Upload RBF programs
    - Run RBF programs
- Compile Ruby into RBF programs
- Supported platforms: Linux
  (bug reports or pull requests for Windows or Mac are also welcome)


## Getting Started

Running the built-in demo program: Connect the brick with a USB cable. Run

```sh
sudo ev3tool run ../prjs/BrkProg_SAVE/Demo.rpf
```

> The `sudo` is needed to access the USB device.
> With udev you can configure the system to allow access to all users like this:
>
>     echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0005", MODE="0666"' \
>       | sudo tee /etc/udev/rules.d/99-org-rubygems-lignite-lego-ev3.rules

To connect with Bluetooth, [configure the address](data/lignite-btaddr) and
pair the device (FIXME: how; troubleshooting?)

See also the included [examples](examples/).

### Hello World

```rb
require "lignite"
dc = Lignite::DirectCommands.new
dc.ui_draw_clean
dc.ui_draw_text(Lignite::FG_COLOR, 20, 40, "Hello, world!")
dc.ui_draw_update
```

## Acknowledgements

Thanks to David Lechner of the ev3dev project for the ev3.yml bytecodes file.
