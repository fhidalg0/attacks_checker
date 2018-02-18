RSpec.describe Checker::Payloads::Payload do
  let(:subject) { Checker::Payloads::Payload }

  context '@load' do
    it 'loads the payload file' do
      allow(subject).to receive(:file).and_return('config_file')
      allow(subject).to receive(:puts)
      allow(subject).to receive(:load_file)

      subject.load
      expect(subject).to have_received(:load_file)
    end
  end

  context '@load_file' do
    it 'loads the payload file' do
      allow(IO).to receive(:foreach)
      allow(subject).to receive(:file).and_return('config_file')

      subject.load_file
      expect(IO).to have_received(:foreach)
    end
  end
end
