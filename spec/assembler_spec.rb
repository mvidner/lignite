require_relative "spec_helper"
require "lignite"

require "fileutils"

describe Lignite::Assembler do
  shared_examples "compiles" do |base, asm_version = 109|
    let(:in_rb) { "#{datadir}/#{base}.rb" }
    let(:actual_rbf) { "#{datadir}/#{base}.out.rbf" }
    let(:expected_rbf) { "#{datadir}/#{base}.rbf" }

    it "correctly assembles #{base}" do
      subject.assemble(in_rb, actual_rbf, version: asm_version)
      expect(rbf_dump(actual_rbf)).to eq(rbf_dump(expected_rbf))
      FileUtils.rm actual_rbf
    end
  end

  it_behaves_like "compiles", "HelloWorld"
  it_behaves_like "compiles", "HelloWorld-subop"
  it_behaves_like "compiles", "VernierReadout"
  it_behaves_like "compiles", "ColorReadout", 106
  it_behaves_like "compiles", "NoDebug"
end
