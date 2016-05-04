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
      cmd.join(" ")
    end

    def execute
      output = `#{command_line}`
      result_class.new(output, $?)
    end

  end
end
