RSpec.describe Checker::Payloads::SQLiRegExp do

  let(:subject) { Checker::Payloads::SQLiRegExp }

  context '@file' do
    it 'have a config file defined' do
      expect(subject.file).to eql('config/payloads/sqli_regexp')
    end
  end

  context '@prepare_for_match' do
    it 'prepare the data erasing end of line characters' do
      attacks = ["((\%3D)|(=))[^\n]*((\%27)|(\')|(\-\-)|(\%3B)|(;))"].map { |p| p.gsub(/[\r\n]+/,'') }
      allow(subject).to receive(:prepare).and_return(attacks)
      
      expect(subject.prepare_for_match).to eql(Regexp.new(Regexp.escape(attacks)))
    end
  end
end
