require 'spec_helper'

RSpec.describe RandomShakespeare, type: :model do

  it 'returns a random line from MacBeth' do
    samples = []
    1000.times { samples << iteration }
    e = samples.first
    count = samples.inject(0) { |c, element| e == element ? c += 1 : c }
    expect(count).to be < 20
    line = random_lines.next
    expect(e.include?(line)).to be_truthy
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
    @random_lines ||= RandomShakespeare.new(parser)
  end

  def parser
    @parser ||= Parser.new('spec/data/macbeth_excerpt.xml')
  end
end
