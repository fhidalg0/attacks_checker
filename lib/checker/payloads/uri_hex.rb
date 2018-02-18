module Checker::Payloads
  class UriHex < Payload
    class << self
      def file
        'config/payloads/uri_hex.txt'
      end

      def prepare_for_inclusion
        prepare
      end
    end
  end
end
