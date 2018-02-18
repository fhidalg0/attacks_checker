#https://www.symantec.com/connect/articles/detection-sql-injection-and-cross-site-scripting-attacks
module Checker::Payloads
  class XSSRegExp < Payload
    class << self
      def file
        'config/payloads/xss_regexp'
      end

      def prepare_for_match
        @attacks.map { |payload| Regexp.new(payload) }
      end
    end
  end
end
