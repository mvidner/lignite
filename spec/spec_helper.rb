
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
def rbf_dump(filename)
  File.read(filename, encoding: Encoding::BINARY).bytes.map do |n|
    format("0x%02x %3d %s", n, n, n.chr.inspect)
  end.join "\n"
end
