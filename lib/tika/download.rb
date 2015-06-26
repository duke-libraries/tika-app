module Tika
  class Download

    DEFAULT_TIKA_VERSION = "1.9"

    def self.call
      version = ENV["TIKA_VERSION"] || DEFAULT_TIKA_VERSION
      destination_path = ENV["TIKA_PATH"] || App::DEFAULT_TIKA_PATH
      unless Dir.exist? File.dirname(destination_path)
        raise Error, "Destination path directory does not exist: #{File.dirname(destination_path)}"
      end
      if File.exist? destination_path
        raise Error, "File exists at destination path #{destination_path}."
      end
      download_basename = "tika-app-#{version}.jar"
      download_url = "http://archive.apache.org/dist/tika/#{download_basename}"

      Dir.mktmpdir do |tmpdir|
        puts "Downloading Tika app from #{download_url} ... "
        FileUtils.cd(tmpdir) do
          system "curl -O #{download_url}"
          FileUtils.mv(download_basename, destination_path)
          puts "Moved Tika app to #{destination_path}."
        end
      end
    end

  end
end
