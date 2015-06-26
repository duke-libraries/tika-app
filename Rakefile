require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "tika/app"

Tika::App.install_tasks

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)

task default: :spec
