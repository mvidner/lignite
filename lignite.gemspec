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

  # ruby -e 'puts `git ls-files`.lines.map { |f| "    %s" % f.strip.inspect }.join ",\n"'
  s.files       = [
    ".coveralls.yml",
    ".gitignore",
    ".rspec",
    ".rubocop.yml",
    ".travis.yml",
    ".yardopts",
    "COPYING",
    "Gemfile",
    "NEWS.md",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/ev3tool",
    "data/ev3.yml",
    "data/lignite-btaddr",
    "data/sysops.yml",
    "examples/bobbee.rb",
    "examples/gyro-sensor.rb",
    "examples/hello.rb",
    "examples/hello.yml",
    "examples/light-sensor.rb",
    "examples/light-sensor.yml",
    "examples/lights.rb",
    "examples/lights.yml",
    "examples/motors.rb",
    "examples/sound.rb",
    "examples/sys_list_files.rb",
    "examples/sys_list_files.yml",
    "lib/lignite.rb",
    "lib/lignite/assembler.rb",
    "lib/lignite/body_compiler.rb",
    "lib/lignite/bytes.rb",
    "lib/lignite/condition.rb",
    "lib/lignite/connection.rb",
    "lib/lignite/connection/bluetooth.rb",
    "lib/lignite/connection/replay.rb",
    "lib/lignite/connection/tap.rb",
    "lib/lignite/connection/usb.rb",
    "lib/lignite/defines.rb",
    "lib/lignite/defines.rb.erb",
    "lib/lignite/direct_commands.rb",
    "lib/lignite/enums.rb",
    "lib/lignite/enums.rb.erb",
    "lib/lignite/ev3_ops.rb",
    "lib/lignite/ev3_tool.rb",
    "lib/lignite/jump_offset.rb",
    "lib/lignite/logger.rb",
    "lib/lignite/message.rb",
    "lib/lignite/motors.rb",
    "lib/lignite/op_compiler.rb",
    "lib/lignite/parameter_declarer.rb",
    "lib/lignite/rbf_declarer.rb",
    "lib/lignite/rbf_object.rb",
    "lib/lignite/system_commands.rb",
    "lib/lignite/variables.rb",
    "lib/lignite/version.rb",
    "lignite.gemspec",
    "rubocop-suse.yml",
    "spec/assembler_spec.rb",
    "spec/connection_usb_spec.rb",
    "spec/data/ColorReadout.lms",
    "spec/data/ColorReadout.rb",
    "spec/data/ColorReadout.rbf",
    "spec/data/HelloWorld-subop.rb",
    "spec/data/HelloWorld-subop.rbf",
    "spec/data/HelloWorld.lms",
    "spec/data/HelloWorld.rb",
    "spec/data/HelloWorld.rbf",
    "spec/data/NoDebug.lms",
    "spec/data/NoDebug.rb",
    "spec/data/NoDebug.rbf",
    "spec/data/Performance.lms",
    "spec/data/Performance.rb",
    "spec/data/Performance.rbf",
    "spec/data/VernierReadout.lms",
    "spec/data/VernierReadout.rb",
    "spec/data/VernierReadout.rbf",
    "spec/data/ev3tool_download.yml",
    "spec/data/ev3tool_list_files.yml",
    "spec/data/ev3tool_start.yml",
    "spec/data/ev3tool_stop.yml",
    "spec/data/ev3tool_upload.yml",
    "spec/data/everstorm.rbf",
    "spec/data/p11.c",
    "spec/data/p11.rb",
    "spec/data/p11.rbf",
    "spec/direct_commands_spec.rb",
    "spec/ev3_tool_spec.rb",
    "spec/spec_helper.rb",
    "spec/system_commands_spec.rb",
    "tools/ops_from_yml"
  ]

  s.executables = s.files.grep(/^bin\//) { |f| File.basename(f) }

  s.required_ruby_version = ">= 2.1" # mandatory keyword arguments
  s.add_dependency "libusb", "~> 0.6"
  s.add_dependency "thor", "~> 0.19"

  s.add_development_dependency "coveralls", "~> 0"
  s.add_development_dependency "rake", ">= 0", "< 99"
  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "rubocop", "0.50.0"
  s.add_development_dependency "simplecov", "~> 0"
  s.add_development_dependency "yard", ">= 0.9.20"
end
