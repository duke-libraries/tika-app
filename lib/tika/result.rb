require "json"
require "forwardable"

module Tika
  class Result
    extend Forwardable

    attr_reader :output, :status

    def_delegator :status, :success?

    def initialize(output, status)
      @output, @status = output, status
    end

    def render
      output
    end
  end

  class TextResult < Result
    def render
      output.strip
    end
  end

  class JSONResult < Result
    def render
      JSON.load(output)
    end
  end

end
