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
      allow_any_instance_of(Lignite::DirectCommands).to receive(:sleep)
      ENV["LIGNITE_REPLAY"] = replay_yml
      expect { load(script) }.not_to raise_error
      ENV["LIGNITE_REPLAY"] = nil
    end
  end

  it_behaves_like "example runner", "hello"
  it_behaves_like "example runner", "lights"
  it_behaves_like "example runner", "light-sensor"
end
