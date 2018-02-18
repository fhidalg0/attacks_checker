module Checker::Payloads
  class XSS < Payload
    class << self
      def file
        'config/payloads/xss.txt'
      end

      def prepare_for_inclusion
        prepare
      end
    end
  end
end
