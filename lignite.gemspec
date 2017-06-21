# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + "/lib/lignite/version")

Gem::Specification.new do |s|
  s.name        = "lignite"
  s.version     = Lignite::VERSION
  s.summary     = "Program LEGO Mindstorms EV3 in Ruby"
  s.description = "Program LEGO Mindstorms EV3 in Ruby"

  s.author      = "Martin Vidner"
  s.email       = "martin@vidner.net"
  s.homepage    = "https://github.com/mvidner/lignite"
  s.license     = "GPL-3.0"

  #  puts `git ls-files`.lines.map { |f| "    %s,\n" % f.strip.inspect }
  s.files       = [
    "Rakefile",
    "VERSION",
    "bin/ev3tool",
    "ev3.yml",
    "lib/lignite.rb",
    "lib/lignite/assembler.rb",
    "lib/lignite/bluetooth_connection.rb",
    "lib/lignite/bytes.rb",
    "lib/lignite/direct_commands.rb",
    "lib/lignite/message_sender.rb",
    "lib/lignite/op_compiler.rb",
    "lib/lignite/sysop_compiler.rb",
    "lib/lignite/usb_connection.rb",
    "lib/lignite/version.rb",
    "lignite.gemspec",
    "sysops.yml",
    "test/data/HelloWorld-subop.rb",
    "test/data/HelloWorld-subop.rbf",
    "test/data/HelloWorld.lms",
    "test/data/HelloWorld.rb",
    "test/data/HelloWorld.rbf",
    "test/data/VernierReadout.lms",
    "test/data/VernierReadout.rb",
    "test/data/VernierReadout.rbf",
    "test/testme.rb",
    "try.rb"
  ]

  s.executables = s.files.grep(/^bin\//) { |f| File.basename(f) }

  s.add_dependency "libusb", "~> 0.6"

  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "yard", "~> 0"
end
