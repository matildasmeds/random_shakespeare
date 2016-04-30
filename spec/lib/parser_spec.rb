require 'spec_helper.rb'
RSpec.describe RandomShakespeare::Parser, type: :model do

  describe '#all_lines' do
    specify { expect(parser.all_lines).to eql(all_lines_fixture) }
  end

  describe '#total_lines' do
    specify { expect(parser.total_lines).to eql(20) }
  end

  describe '#lines_by_speaker' do
    it 'returns correct lines per speaker' do
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
    filename = 'spec/lib/data/macbeth_excerpt.xml'
    @parser ||= RandomShakespeare::Parser.new(filename)
  end

  def all_lines_fixture
    {"First Witch"=>["When shall we three meet again\nIn thunder, lightning, or in rain?", "Where the place?", "I come, Graymalkin!"], "Second Witch"=>["When the hurlyburly's done,\nWhen the battle's lost and won.", "Upon the heath.", "Paddock calls."], "Third Witch"=>["That will be ere the set of sun.", "There to meet with Macbeth.", "Anon."], "All"=>["Fair is foul, and foul is fair:\nHover through the fog and filthy air."], "Macduff"=>["He has no children. All my pretty ones?\nDid you say all? O hell-kite! All?\nWhat, all my pretty chickens and their dam\nAt one fell swoop?", "I shall do so;\nBut I must also feel it as a man:\nI cannot but remember such things were,\nThat were most precious to me. Did heaven look on,\nAnd would not take their part? Sinful Macduff,\nThey were all struck for thee! naught that I am,\nNot for their own demerits, but for mine,\nFell slaughter on their souls. Heaven rest them now!", "O, I could play the woman with mine eyes\nAnd braggart with my tongue! But, gentle heavens,\nCut short all intermission; front to front\nBring thou this fiend of Scotland and myself;\nWithin my sword's length set him; if he 'scape,\nHeaven forgive him too!"], "Malcolm"=>["Dispute it like a man.", "Be this the whetstone of your sword: let grief\nConvert to anger; blunt not the heart, enrage it."], "Doctor"=>["I have two nights watched with you, but can perceive\nno truth in your report. When was it she last walked?", "A great perturbation in nature, to receive at once\nthe benefit of sleep, and do the effects of\nwatching! In this slumbery agitation, besides her\nwalking and other actual performances, what, at any\ntime, have you heard her say?"], "Gentlewoman"=>["Since his majesty went into the field, I have seen\nher rise from her bed, throw her night-gown upon\nher, unlock her closet, take forth paper, fold it,\nwrite upon't, read it, afterwards seal it, and again\nreturn to bed; yet all this while in a most fast sleep.", "That, sir, which I will not report after her.", "Good night, good doctor."]}
  end
end
