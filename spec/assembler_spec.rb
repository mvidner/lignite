require_relative "spec_helper"
require "lignite"

require "fileutils"

describe Lignite::Assembler do
  shared_examples "compiles" do |base, asm_version|
    let(:in_rb) { "#{datadir}/#{base}.rb" }
    let(:actual_rbf) { "#{datadir}/#{base}.out.rbf" }
    let(:expected_rbf) { "#{datadir}/#{base}.rbf" }

    it "correctly assembles #{base}" do
      subject.assemble(in_rb, actual_rbf, version: asm_version)
      expect(FileUtils.compare_file(expected_rbf, actual_rbf)).to be_truthy
      FileUtils.rm actual_rbf
    end
  end

  it_behaves_like "compiles", "HelloWorld", 109
  it_behaves_like "compiles", "HelloWorld-subop", 109
  it_behaves_like "compiles", "VernierReadout", 109
  it_behaves_like "compiles", "ColorReadout", 106
  it_behaves_like "compiles", "NoDebug", 109
end
