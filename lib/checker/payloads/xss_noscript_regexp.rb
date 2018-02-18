module Checker::Payloads
  class XSSNoScriptRegExp < Payload
    class << self
      #RegExp from NoScript Plugin for Firefox
      def file
        'config/payloads/xss_noscript_regexp'
      end

      def prepare_for_match
        [prepare]
      end
    end
  end
end
