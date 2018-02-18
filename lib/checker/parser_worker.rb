module Checker
  class ParserWorker
    include Celluloid

    STRATEGIES = [
      Strategies::Match,
      Strategies::Inclusion
    ].freeze

    def parse(line)
      STRATEGIES.detect{ |strategy| strategy.new(line).perform }
    end
  end
end
