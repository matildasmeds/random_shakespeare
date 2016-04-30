require 'spec_helper'
RSpec.describe RandomShakespeare::Lines, type: :model do
  describe '#next' do
    it 'returns a random line from MacBeth' do
      samples = []
      100.times { samples << iteration }
      e = samples.first
      count = samples.inject(0) { |c, element| e == element ? c += 1 : c }
      expect(count).to be < 2
      line = random_lines.next
      expect(e.include?(line)).to be_truthy
      lines = parser.total_lines.times.map{ |l| random_lines.next }
      expect(lines.uniq.count).to eql(lines.count)
    end
  end

  def iteration
    row = []
    parser.total_lines.times do
      line = random_lines.next
      row << line
    end
    row
  end

  def random_lines
    @random_lines ||= RandomShakespeare::Lines.new(parser)
  end

  def parser
    filename = 'spec/lib/data/macbeth_excerpt.xml'
    @parser ||= RandomShakespeare::Parser.new(filename)
  end
end
