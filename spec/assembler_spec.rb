require_relative "spec_helper"
require "lignite"

require "fileutils"

describe Lignite::Assembler do
  shared_examples "compiles" do |base|
    let(:datadir) { File.expand_path("../data", __FILE__) }

    let(:in_rb) { "#{datadir}/#{base}.rb" }
    let(:actual_rbf) { "#{datadir}/#{base}.out.rbf" }
    let(:expected_rbf) { "#{datadir}/#{base}.rbf" }

    it "correctly assembles #{base}" do
      subject.assemble(in_rb, actual_rbf)
      expect(FileUtils.compare_file(expected_rbf, actual_rbf)).to be_truthy
      FileUtils.rm actual_rbf
    end
  end

  include_examples "compiles", "HelloWorld"
  include_examples "compiles", "HelloWorld-subop"
  include_examples "compiles", "VernierReadout"
end
