module Tika
  RSpec.describe App do

    describe "#get_text" do
      describe "with a document" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.docx") }
        it "should return the text of the file" do
          text = subject.get_text(file)
          expect(text).to match(/Lorem ipsum/)
        end
      end
      describe "with an image" do
        let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.tiff") }
        it "should return the text of the file" do
          text = subject.get_text(file)
          expect(text).to match(/^Lorem ipsum/)
        end
      end
    end

    describe "#get_metadata" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.pdf") }
      it "should return the metadata of the file" do
        metadata = subject.get_metadata(file, content_type: "application/pdf")
        expect(metadata["Creation-Date"]).to eq("2015-02-15T01:54:41Z")
      end
    end

    describe "#get_version" do
      it "should return the Tika app version" do
        expect(subject.get_version).to match(/^Apache Tika/)
      end
    end

    describe "#get_mime_types" do
      it "should return the MIME Types support by the Tika app" do
        expect(subject.get_mime_types).to match(/application\/pdf/)
      end
    end

    describe "#get_parsers" do
      it "should return the parsers available to the Tika app" do
        expect(subject.get_parsers).to match(/org\.apache\.tika\.parser\.DefaultParser/)
      end
    end

    describe "#get_parsers_details" do
      it "should return the parsers available to the Tika app and the MIME types they support" do
        expect(subject.get_parsers_details).to match(/org\.apache\.tika\.parser\.DefaultParser/)
      end
    end

    describe "#get_detectors" do
      it "should return the detectors available to the Tika app" do
        expect(subject.get_detectors).to match(/org\.apache\.tika\.detect\.DefaultDetector/)
      end
    end

    describe "#detect" do
      let(:file) { File.join(FIXTURE_DIR, "Lorem_ipsum.png") }
      it "should return the MIME type of the resource (if successful)" do
        expect(subject.detect(file)).to eq("image/png")
      end
    end

    describe "#get_language" do
      let(:file) { "http://www.archives.gov/exhibits/charters/constitution_transcript.html" }
      it "should return the language code" do
        expect(subject.get_language(file)).to eq("en")
      end
    end

  end
end
