module Checker::Strategies
  class Match < Strategy
    PAYLOADS = [
      Checker::Payloads::SQLiRegExp,
      Checker::Payloads::XSSRegExp,
      Checker::Payloads::FormatStrings,
      Checker::Payloads::XSSNoScriptRegExp
    ].freeze

    #TODO: Refactor passing block
    def perform
      PAYLOADS.detect do |payload|
        attack = payload.prepare_for_match.detect{ |p| p =~ @line }
        prepare_log(payload.name, attack) if attack
        attack
      end
    end
  end
end
