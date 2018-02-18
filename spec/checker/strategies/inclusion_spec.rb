RSpec.describe Checker::Strategies::Inclusion do
  let(:payload) { double(:payload) }
  subject(:strategy) { Checker::Strategies::Inclusion.new('example XSS') } 

  context '#perform' do
    it 'returns the payload that matches the strategy' do
      allow(payload).to receive(:prepare_for_inclusion).and_return(['XSS'])
      allow(payload).to receive(:name).and_return('PAYLOAD')
      allow(strategy).to receive(:puts)
      stub_const('Checker::Strategies::Inclusion::PAYLOADS', [payload])

      expect(strategy.perform).to eql(payload)
    end     

    it 'returns nil if there is no payload that matches the strategy' do
      allow(payload).to receive(:prepare_for_inclusion).and_return(['LALA'])
      allow(payload).to receive(:name).and_return('PAYLOAD')
      allow(strategy).to receive(:puts)
      stub_const('Checker::Strategies::Inclusion::PAYLOADS', [payload])

      expect(strategy.perform).to eql(nil)
    end 
  end
end
