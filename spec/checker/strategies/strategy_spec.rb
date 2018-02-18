RSpec.describe Checker::Strategies::Strategy do
  subject(:strategy) { Checker::Strategies::Strategy.new('Example Log') } 
  let(:options) { { strategy: 'Stragegy', payload_type: 'Payload Type', payload: 'Payload', line: 'Line' } }

  context '#log_attacker' do
    it 'Open a file to log attacks' do
      allow(File).to receive(:open)
      allow(strategy).to receive(:puts)

      strategy.log_attacker(options)
      expect(File).to have_received(:open)
    end
  end

  context '#file_path' do
    it 'returns path file to output log file' do
      expect(strategy.file_path).to be_eql("./malicious.log")
    end
  end

  context '#options_presenter' do
    it 'returns the possible attack string' do
      expect(strategy.options_presenter(options)).to be_eql("POSSIBLE ATTACK: Stragegy => Payload Type => Payload\n\t Line")
    end
   end

  context '#prepare_log' do
    it 'preprare output and call log_attacker' do
      allow(strategy).to receive(:log_options).and_return(options)
      allow(strategy).to receive(:log_attacker)
      strategy.prepare_log('PAYLOAD', 'ATTACK')
      expect(strategy).to have_received(:log_attacker)
    end
  end

  context '#log_options' do
    it 'returns options for logging' do
      response =  {:strategy=>"Checker::Strategies::Strategy", :payload_type=>"PAYLOAD", :payload=>"ATTACK", :line=>"Example Log"}
      expect(strategy.log_options('PAYLOAD', 'ATTACK')).to eql(response)
    end
  end
end
