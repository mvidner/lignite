
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    # If you misremember a method name both in code and in tests,
    # this will save you.
    # https://relishapp.com/rspec/rspec-mocks/v/3-0/docs/verifying-doubles/partial-doubles
    mocks.verify_partial_doubles = true
  end
end

if ENV["COVERAGE"]
  require "simplecov"
  lib = File.expand_path("../../lib", __FILE__)
  # track all ruby files under src
  SimpleCov.track_files("#{lib}/**/*.rb")

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
