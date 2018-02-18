RSpec.describe Checker::Payloads::FormatStrings do

  let(:subject) { Checker::Payloads::FormatStrings }

  context '@file' do
    it 'have a config file defined' do
      expect(subject.file).to eql('config/payloads/format_strings.txt')
    end
  end

  context '@prepare_for_inclusion' do
    it 'prepare the data erasing end of line characters' do
      attacks = "%s%p%x%d\n%p%p%p%p\n%x%x%x%x\n%d%d%d%d\n%s%s%s%s".gsub(/[\r\n]+/,'')
      allow(subject).to receive(:prepare).and_return([attacks])
      
      expect(subject.prepare_for_inclusion).to eql([attacks])
    end
  end

  context '@prepare_for_match' do
    it 'prepare the data erasing end of line characters' do
      attacks = "%s%p%x%d\n%p%p%p%p\n%x%x%x%x\n%d%d%d%d\n%s%s%s%s".gsub(/[\r\n]+/,' ').split(' ')
      allow(subject).to receive(:prepare).and_return(attacks)
      
      expect(subject.prepare_for_match).to eql(attacks.map { |p| Regexp.new(Regexp.escape(p)) })
    end
  end
end
