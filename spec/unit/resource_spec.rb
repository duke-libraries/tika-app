module Tika
  RSpec.describe Resource do

    subject { described_class.new(file) }

    describe "#text" do
      describe "with a document" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.docx") }
        it "should return the text of the file" do
          expect(subject.text).to match(/^Lorem ipsum/)
        end
      end
      describe "with an image" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.tiff") }
        it "should return the text of the file" do
          expect(subject.text).to match(/^Lorem ipsum/)
        end
      end
    end

    describe "#metadata" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.pdf") }
      it "should return the metadata of the file" do
        expect(subject.metadata["Creation-Date"]).to eq("2015-02-15T01:54:41Z")
      end
    end

    describe "#content_type" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.png") }
      it "should return the MIME type of the resource (if successful)" do
        expect(subject.content_type).to eq("image/png")
      end
    end

    describe "#language" do
      let(:file) { "http://www.archives.gov/exhibits/charters/constitution_transcript.html" }
      it "should return the language code" do
        expect(subject.language).to eq("en")
      end
    end

  end
end
