module Checker::Payloads
  class Payload
    class << self
      attr_reader :attacks

      def load
        puts "Loading: #{name}"
        @attacks ||= load_file
      end

      def load_file
        IO.foreach(file)
      end

      def prepare
        @attacks.map { |p| p.gsub(/[\r\n]+/,'') }
      end
    end
  end
end
