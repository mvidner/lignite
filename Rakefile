task default: :test

desc "Run tests"
task :test do
  system "rspec"
end

EV3_YML = "data/ev3.yml".freeze
GENERATOR = "tools/ops_from_yml".freeze
OPS = "lib/lignite/ev3_ops.rb".freeze

desc "Regenerate the EV3 assembler operations"
task ops: OPS

file OPS => [EV3_YML, GENERATOR] do |t|
  sh GENERATOR, t.prerequisites.first, t.name
end
