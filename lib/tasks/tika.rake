require "tempfile"

DEFAULT_VERSION = "1.12"

namespace :tika do
  desc "Download Tika jar"
  task :download, [:version] do |t, args|
    contrib = File.expand_path('../../../contrib', __FILE__)
    FileUtils.mkdir_p(contrib)
    version = args[:version] || DEFAULT_VERSION
    jar = "tika-app-#{version}.jar"
    dest = File.join(contrib, jar)
    if File.exist?(dest)
      puts "Tika #{version} previously downloaded to #{dest}."
    else
      Dir.mktmpdir do |tmpdir|
        FileUtils.cd(tmpdir) do
          `curl -O http://archive.apache.org/dist/tika/#{jar}`
          FileUtils.mv(jar, contrib)
        end
      end
      puts "Tika #{version} downloaded to #{dest}."
    end
    FileUtils.cd(contrib) do
      link = "tika-app.jar"
      unless File.exist?(link)
        begin
          File.symlink(jar, link)
          puts "Symlink created: #{File.absolute_path(link)}."
        rescue NotImplementedError
          File.cp(jar, link)
          puts "File copied to #{File.absolute_path(link)}."
        end
      end
    end
  end
end
