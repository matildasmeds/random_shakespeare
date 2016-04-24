require 'spec_helper.rb'
RSpec.describe Parser, type: :model do

  describe '#lines_by_speaker' do

    it 'parses source correctly' do
      gentlewoman_lines = parser.lines_by_speaker('Gentlewoman')
      expect(gentlewoman_lines.count).to eql(3)
      gentlewoman_last = 'Good night, good doctor.'
      expect(gentlewoman_lines.last).to eql(gentlewoman_last)

      malcolm_lines = parser.lines_by_speaker('Malcolm')
      expect(malcolm_lines.count).to eql(2)
      malcolm_first = 'Dispute it like a man.'
      malcolm_second = "Be this the whetstone of your sword: let grief\n"
      malcolm_second << 'Convert to anger; blunt not the heart, enrage it.'
      expect(malcolm_lines[0]).to eql(malcolm_first)
      expect(malcolm_lines[1]).to eql(malcolm_second)
    end

  end
  describe '#speakers' do
    it 'returns all speakers' do
      list = parser.speakers
      expect(list.include? 'First Witch').to be_truthy
      expect(list.include? 'Second Witch').to be_truthy
      expect(list.include? 'Third Witch').to be_truthy
      expect(list.include? 'Macduff').to be_truthy
      expect(list.include? 'Malcolm').to be_truthy
      expect(list.include? 'Doctor').to be_truthy
      expect(list.include? 'Gentlewoman').to be_truthy
      expect(list.include? 'All').to be_truthy
    end
  end

  def parser
    @parser ||= Parser.new('spec/data/macbeth_excerpt.xml')
  end
end
