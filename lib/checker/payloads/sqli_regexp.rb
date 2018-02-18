module Checker::Payloads
  class SQLiRegExp < Payload
    class << self
      def file
        'config/payloads/sqli_regexp'
      end

      def prepare_for_match
        prepare.map { |payload| Regexp.new(payload) }
      end
    end
  end
end
