require_relative "error"
require_relative "commands"
require_relative "resource"
require_relative "rake_tasks"

module Tika
  class App

    DEFAULT_TIKA_PATH = File.expand_path("../../../bin/tika-app.jar", __FILE__)

    class << self
      attr_accessor :path

      def install_tasks
        RakeTasks.install
      end
    end

    include Commands

    attr_reader :path
    attr_accessor :result

    def initialize(opts={})
      @path = opts[:path] || self.class.path || ENV["TIKA_APP"] || DEFAULT_TIKA_PATH
    end

    def get_text(file, opts={})
      execute GetTextCommand, file, opts
    end

    def get_metadata(file, opts={})
      execute GetMetadataCommand, file, opts
    end

    def get_version
      execute GetVersionCommand
    end

    def get_mime_types
      execute GetMimeTypesCommand
    end
    alias_method :list_supported_types, :get_mime_types

    def get_parsers
      execute GetParsersCommand
    end
    alias_method :list_parsers, :get_parsers

    def get_parsers_details
      execute GetParsersDetailsCommand
    end
    alias_method :list_parser_details, :get_parsers_details

    def get_detectors
      execute GetDetectorsCommand
    end
    alias_method :list_detectors, :get_detectors

    def detect(file, opts={})
      execute DetectCommand, file, opts
    end

    def get_language(file, opts={})
      execute GetLanguageCommand, file, opts
    end

    def get_metadata_models
      execute GetMetadataModelsCommand
    end
    alias_method :list_met_models, :get_metadata_models

    def command_line
      ["java", "-jar", path].freeze
    end

    private

    def reset
      @result = nil
    end

    def execute(command, *args)
      reset
      @result = command.execute(self, *args)
      if result.success?
        result.render
      else
        raise Error, result.error
      end
    end

  end
end
