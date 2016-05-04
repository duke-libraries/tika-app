module Tika
  RSpec.describe Resource do

    subject { described_class.new(file) }

    describe "#text" do
      describe "with a document" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.docx") }
        its(:text) { is_expected.to match(/^Lorem ipsum/) }
      end
      describe "with an image" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.tiff") }
        its(:text) { is_expected.to match(/^Lorem ipsum/) }
      end
    end

    describe "#metadata" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.pdf") }
      it "returns the metadata of the file" do
        expect(subject.metadata["Creation-Date"]).to eq("2015-02-15T01:54:41Z")
      end
    end

    describe "#content_type" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.png") }
      its(:content_type) { is_expected.to eq("image/png") }
    end

    describe "#language" do
      let(:file) { "http://www.archives.gov/exhibits/charters/constitution_transcript.html" }
      its(:language) { is_expected.to eq("en") }
    end

  end
end
