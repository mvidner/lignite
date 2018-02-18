# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + "/lib/lignite/version")

Gem::Specification.new do |s|
  s.name        = "lignite"
  s.version     = Lignite::VERSION
  s.summary     = "Program LEGO Mindstorms EV3 in Ruby"
  s.description = <<TXT
Lignite is a set of Ruby tools to interact with LEGO Mindstorms EV3.
It uses the original LMS2012 firmware, so ev3dev is not required.
TXT

  s.author      = "Martin Vidner"
  s.email       = "martin@vidner.net"
  s.homepage    = "https://github.com/mvidner/lignite"
  s.license     = "GPL-3.0-only"

  # ruby -e 'puts `git ls-files`.lines.map { |f| "    %s,\n" % f.strip.inspect }'
  s.files       = [
    ".gitignore",
    "COPYING",
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/ev3tool",
    "data/ev3.yml",
    "data/lignite-btaddr",
    "data/sysops.yml",
    "examples/hello.rb",
    "examples/lights.rb",
    "examples/motors.rb",
    "examples/sound.rb",
    "examples/sys_list_files.rb",
    "lib/lignite.rb",
    "lib/lignite/assembler.rb",
    "lib/lignite/body_compiler.rb",
    "lib/lignite/bytes.rb",
    "lib/lignite/connection.rb",
    "lib/lignite/connection/bluetooth.rb",
    "lib/lignite/connection/usb.rb",
    "lib/lignite/direct_commands.rb",
    "lib/lignite/logger.rb",
    "lib/lignite/message.rb",
    "lib/lignite/message_sender.rb",
    "lib/lignite/op_compiler.rb",
    "lib/lignite/rbf_object.rb",
    "lib/lignite/system_commands.rb",
    "lib/lignite/variables.rb",
    "lib/lignite/version.rb",
    "lignite.gemspec",
    "spec/assembler_spec.rb",
    "spec/data/HelloWorld-subop.rb",
    "spec/data/HelloWorld-subop.rbf",
    "spec/data/HelloWorld.lms",
    "spec/data/HelloWorld.rb",
    "spec/data/HelloWorld.rbf",
    "spec/data/VernierReadout.lms",
    "spec/data/VernierReadout.rb",
    "spec/data/VernierReadout.rbf",
    "spec/spec_helper.rb"
  ]

  s.executables = s.files.grep(/^bin\//) { |f| File.basename(f) }

  s.add_dependency "libusb", "~> 0.6"

  s.add_development_dependency "coveralls", "~> 0"
  s.add_development_dependency "simplecov", "~> 0"
  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "yard", "~> 0"
end
