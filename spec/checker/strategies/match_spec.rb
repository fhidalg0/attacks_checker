RSpec.describe Checker::Strategies::Match do
  let(:payload) { double(:payload) }
  subject(:strategy) { Checker::Strategies::Match.new('example XSS') } 

  context '#perform' do
    it 'returns the payload that matches the strategy' do
      allow(payload).to receive(:prepare_for_match).and_return([/XSS/])
      allow(payload).to receive(:name).and_return('PAYLOAD')
      allow(strategy).to receive(:puts)
      stub_const('Checker::Strategies::Match::PAYLOADS', [payload])

      expect(strategy.perform).to eql(payload)
    end     

    it 'returns nil if there is no payload that matches the strategy' do
      allow(payload).to receive(:prepare_for_match).and_return([/LALA/])
      allow(payload).to receive(:name).and_return('PAYLOAD')
      allow(strategy).to receive(:puts)
      stub_const('Checker::Strategies::Match::PAYLOADS', [payload])

      expect(strategy.perform).to eql(nil)
    end 
  end
end
