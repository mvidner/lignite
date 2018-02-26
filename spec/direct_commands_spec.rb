require_relative "spec_helper"
require "lignite"

require "fileutils"

describe Lignite::DirectCommands do
  shared_examples "example runner" do |base|
    let(:example_dir) { File.expand_path("../../examples", __FILE__) }

    let(:script) { "#{example_dir}/#{base}.rb" }
    let(:replay_yml) { "#{example_dir}/#{base}.yml" }

    before(:each) { Lignite::Message.reset_msgid }

    it "correctly runs #{base}.rb" do
      ENV["LIGNITE_REPLAY"] = replay_yml
      expect { load(script) }.not_to raise_error
    end
  end

  it_behaves_like "example runner", "hello"
  it_behaves_like "example runner", "lights"
  it_behaves_like "example runner", "light-sensor"
end
