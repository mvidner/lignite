# typed: false
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    # If you misremember a method name both in code and in tests,
    # this will save you.
    # https://relishapp.com/rspec/rspec-mocks/v/3-0/docs/verifying-doubles/partial-doubles
    mocks.verify_partial_doubles = true
  end
end

if ENV["COVERAGE"] || ENV["TRAVIS"]
  require "simplecov"
  top = File.expand_path("../..", __FILE__)
  # track all ruby files under lib
  SimpleCov.track_files("#{top}/lib/**/*.rb")
  # filter out the huge generated file
  SimpleCov.add_filter("ev3_ops.rb")

  # use coveralls for on-line code coverage reporting at Travis CI
  if ENV["TRAVIS"]
    require "coveralls"
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
    ]
  end
  SimpleCov.start
end

def datadir
  File.expand_path("../data", __FILE__)
end

# for better displays in rspec failure diffs
def rbf_dump(bytestring, offsets: false)
  lines = bytestring.bytes.map do |n|
    format("0x%02x %3d %s", n, n, n.chr.inspect)
  end
  if offsets
    lines.each_with_index do |l, i|
      l.replace("#{i}: #{l}")
    end
  end
  lines.join "\n"
end

def expect_rbf_files_same(actual_rbf, expected_rbf)
  actual_bytes = File.read(actual_rbf, encoding: Encoding::BINARY)
  expected_bytes = File.read(expected_rbf, encoding: Encoding::BINARY)

  show_offsets = actual_bytes.bytesize == expected_bytes.bytesize
  actual_dump = rbf_dump(actual_bytes, offsets: show_offsets)
  expected_dump = rbf_dump(expected_bytes, offsets: show_offsets)

  expect(actual_dump).to eq(expected_dump)
end
