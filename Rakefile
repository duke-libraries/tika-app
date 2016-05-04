require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "tika/app"

load 'tasks/tika.rake'

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :ci => ['tika:download'] do
  ENV["TIKA_APP"] = File.join(File.expand_path('../contrib', __FILE__), 'tika-app.jar')
  Rake::Task[:spec].invoke
end
