module Checker
  class Loader
    def self.load_payloads
      new()
    end

    private

    PAYLOADS = [
      Checker::Payloads::XSS,
      Checker::Payloads::UriHex,
      Checker::Payloads::FormatStrings,
      Checker::Payloads::XSSNoScriptRegExp, 
      Checker::Payloads::SQLiRegExp,
      Checker::Payloads::XSSRegExp
    ]

    def initialize
      puts 'LOADING Payloads'
      PAYLOADS.each{|payload| payload.load }
    end
  end
end
