module Checker::Strategies
  class Strategy
    def initialize(line) 
      #TODO: Prepare the log line to get more results
      #according with the strategy, get parameters etc
      @line = line
    end

    def log_attacker(options)
      File.open(file_path, 'a') { |file| file.write("#{options_presenter(options)}\n") }
    end

    def file_path
      "#{OUTPUT_LOG_FOLDER}#{OUTPUT_LOG}"
    end
    
    def options_presenter(options)
      "POSSIBLE ATTACK: #{options[:strategy]} => #{options[:payload_type]} => #{options[:payload]}\n\t #{options[:line]}"
    end

    def prepare_log(payload_type, attack)
      options = log_options(payload_type, attack)
      puts options_presenter options
      log_attacker options 
    end

    def log_options(payload_type, attack)
      {
        strategy: self.class.name,
        payload_type: payload_type,
        payload: attack, 
        line: @line
      } 
    end
  end
end
