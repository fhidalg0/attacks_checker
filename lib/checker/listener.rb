module Checker
  class Listener
    def initialize
      puts "LISTENING on: #{INPUT_LOG_FOLDER+INPUT_LOG}"
      @parser_pool = ParserWorker.pool(size: POOL_SIZE)

      listen { |data| init_parse(data) }
    end

    def listen
      open(INPUT_LOG) do |file|
        file.seek(0, IO::SEEK_END)
        queue = INotify::Notifier.new 

        queue.watch(INPUT_LOG, :modify) do
          entry = file.read
          yield entry unless entry.empty?
        end

        queue.run
      end
    end

    def init_parse(input)
      input.split(/\n/).each { |line| @parser_pool.async.parse(line) }
    end
  end
end
