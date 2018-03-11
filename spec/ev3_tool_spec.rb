require_relative "spec_helper"
require "lignite/ev3_tool"

require "fileutils"

describe Lignite::Ev3Tool do
  around(:each) do |example|
    ENV["LIGNITE_REPLAY"] = replay
    example.call
    subject.close
    ENV["LIGNITE_REPLAY"] = nil
  end

  before(:each) { Lignite::Message.reset_msgid }

  describe "#raw_ls" do
    let(:replay) { "#{datadir}/ev3tool_list_files.yml" }

    it "communicates and returns the right thing" do
      expected = [
        "everstorm.rbf",
        "sneeze.rsf",
        "hey.rsf",
        "right.rsf",
        "ok0.rsf",
        "ok1.rsf",
        "left.rsf"
      ]

      expect(subject.raw_ls("everstorm")).to eq(expected)
    end
  end

  describe "#start" do
    let(:replay) { "#{datadir}/ev3tool_start.yml" }

    it "communicates the right thing" do
      expect { subject.start("everstorm") }.not_to raise_error
    end
  end

  describe "#stop" do
    let(:replay) { "#{datadir}/ev3tool_stop.yml" }

    it "communicates the right thing" do
      expect { subject.stop }.not_to raise_error
    end
  end

  describe "#download" do
    let(:replay) { "#{datadir}/ev3tool_download.yml" }

    it "communicates the right thing" do
      expected_file_contents = File.read("#{datadir}/everstorm.rbf", mode: "rb")
      e1 = expected_file_contents[0...1000]
      e2 = expected_file_contents[1000..-1]
      f = double("File")
      expect(File).to receive(:open).with("everstorm.rbf", "w").and_yield(f)
      allow(File).to receive(:open).and_call_original
      expect(f).to receive(:write).with(e1)
      expect(f).to receive(:write).with(e2)

      expect { subject.download("../prjs/everstorm/everstorm.rbf") }.not_to raise_error
    end
  end

  describe "#upload" do
    let(:replay) { "#{datadir}/ev3tool_upload.yml" }

    it "communicates the right thing" do
      expect { subject.upload("#{datadir}/HelloWorld.rbf") }.not_to raise_error
    end
  end
end
