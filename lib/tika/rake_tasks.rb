require "rake"
require_relative "download"

module Tika
  module RakeTasks

    extend ::Rake::DSL

    def self.install
      namespace :tika_app do
        desc "Download Tika app (TIKA_VERSION=[#{Download::DEFAULT_TIKA_VERSION}]" \
             " TIKA_PATH=[#{App::DEFAULT_TIKA_PATH}])"
        task :download do
          Download.call
        end
      end
    end

  end
end
