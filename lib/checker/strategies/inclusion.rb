module Checker::Strategies
  class Inclusion < Strategy
    PAYLOADS = [
      Checker::Payloads::UriHex,
      Checker::Payloads::FormatStrings,
      Checker::Payloads::XSS
    ].freeze

    #TODO: Refactor passing block
    def perform
      PAYLOADS.detect do |payload|
        attack = payload.prepare_for_inclusion.detect{ |p| @line.include?(p) }
        prepare_log(payload.name, attack) if attack
        attack
      end
    end
  end
end
