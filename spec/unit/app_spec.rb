module Tika
  RSpec.describe App do

    describe "#get_text" do
      describe "with a document" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.docx") }
        it "returns the text of the file" do
          text = subject.get_text(file)
          expect(text).to match(/Lorem ipsum/)
        end
      end
      describe "with an image" do
        pending "Decision on including Tesseract dependency"
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.tiff") }
        it "returns the text of the file" do
          text = subject.get_text(file)
          expect(text).to match(/^Lorem ipsum/)
        end
      end
    end

    describe "#get_metadata" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.pdf") }
      it "returns the metadata of the file" do
        metadata = subject.get_metadata(file, content_type: "application/pdf")
        expect(metadata["Creation-Date"]).to eq("2015-02-15T01:54:41Z")
      end
    end

    describe "#get_version" do
      its(:get_version) { is_expected.to match(/^Apache Tika/) }
    end

    describe "#get_mime_types" do
      its(:get_mime_types) { is_expected.to match(/application\/pdf/) }
    end

    describe "#get_parsers" do
      its(:get_parsers) {
        is_expected.to match(/org\.apache\.tika\.parser\.DefaultParser/)
      }
    end

    describe "#get_parsers_details" do
      its(:get_parsers_details) {
        is_expected.to match(/org\.apache\.tika\.parser\.DefaultParser/)
      }
    end

    describe "#get_detectors" do
      its(:get_detectors) {
        is_expected.to match(/org\.apache\.tika\.detect\.DefaultDetector/)
      }
    end

    describe "#detect" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.png") }
      it "returns the MIME type of the resource (if successful)" do
        expect(subject.detect(file)).to eq("image/png")
      end
    end

    describe "#get_language" do
      let(:file) {
        "http://www.archives.gov/exhibits/charters/constitution_transcript.html"
      }
      it "returns the language code" do
        expect(subject.get_language(file)).to eq("en")
      end
    end

  end
end
