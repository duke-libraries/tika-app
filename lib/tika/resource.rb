module Tika
  class Resource

    attr_reader :file, :app, :opts
    
    def initialize(file, opts={})
      @file = file
      @app = App.new
      @opts = opts
    end

    def text
      @text ||= app.get_text(file, opts)
    end

    def metadata
      @metadata ||= app.get_metadata(file, opts)
    end

    def content_type
      @content_type ||= app.detect(file, opts)
    end

    def language
      @language ||= app.get_language(file, opts)
    end

  end
end
