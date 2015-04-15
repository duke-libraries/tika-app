require "open3"
require "tempfile"
require_relative "result"

module Tika
  class Command

    class << self
      attr_accessor :options, :result_class

      def execute(app, *args)
        new(app, *args).execute
      end
    end

    attr_reader :app, :file, :options

    def initialize(app, *args)
      @app = app
      @file = args.shift
      @options = args.pop || {}
    end

    def result_class
      self.class.result_class
    end

    def command_line
      cmd = app.command_line + self.class.options
      if options[:password]
        cmd << "-p#{options[:password]}"
      end
      if file
        cmd << file
      end
      cmd
    end

    def execute
      raw_result = Open3.capture3(*command_line)
      result_class.new(*raw_result)
    end

  end
end
