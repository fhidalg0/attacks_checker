module Checker::Payloads
  class FormatStrings < Payload
    class << self
      def file
        'config/payloads/format_strings.txt'
      end

      def prepare_for_inclusion
        prepare
      end

      def prepare_for_match
        prepare.map { |p| Regexp.new(Regexp.escape(p)) }
      end
    end
  end
end
