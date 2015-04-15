require_relative "command"

module Tika
  module Commands

    class GetTextCommand < Command
      self.options = ["-t", "-eUTF8"]
      self.result_class = TextResult
    end

    class GetMetadataCommand < Command
      self.options = ["-j"]
      self.result_class = JSONResult
    end

    class GetVersionCommand < Command
      self.options = ["-V"]
      self.result_class = TextResult
    end

    class GetMimeTypesCommand < Command
      self.options = ["--list-supported-types"]
      self.result_class = TextResult
    end

    class GetParsersCommand < Command
      self.options = ["--list-parsers"]
      self.result_class = TextResult
    end

    class GetParsersDetailsCommand < Command
      self.options = ["--list-parser-details"]
      self.result_class = TextResult
    end

    class GetDetectorsCommand < Command
      self.options = ["--list-detectors"]
      self.result_class = TextResult
    end

    class DetectCommand < Command
      self.options = ["-d"]
      self.result_class = TextResult
    end

    class GetMetadataModelsCommand < Command
      self.options = ["--list-met-models"]
      self.result_class = TextResult
    end

    class GetLanguageCommand < Command
      self.options = ["-l"]
      self.result_class = TextResult
    end

  end
end
