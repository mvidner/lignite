#!/usr/bin/ruby
$: << "../lib"
require "lignite"
require "fileutils"

def test_case(base_name)
  puts "Test: #{base_name} starting..."

  asm = Lignite::Assembler.new
  in_rb = "data/#{base_name}.rb"
  actual_rbf = "data/#{base_name}.out.rbf"
  expected_rbf = "data/#{base_name}.rbf"
  asm.assemble(in_rb, actual_rbf)
  success = system "cmp #{expected_rbf} #{actual_rbf}"
  raise "Test failed for #{actual_rbf}" unless success
  FileUtils.rm actual_rbf

  puts "Test: #{base_name} PASSED."
end

test_case "HelloWorld"
test_case "HelloWorld-subop"
