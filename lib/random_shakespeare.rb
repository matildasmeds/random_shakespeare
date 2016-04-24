require_relative 'parser.rb'
require_relative 'downloader.rb'
class RandomShakespeare
  attr_reader :total_lines

  def initialize(parser = nil)
    @parser = parser || Parser.new(Downloader.filename)
    @total_lines = @parser.total_lines
    init_lines
  end

  def next
    init_lines if @lines == {}
    rand_speaker = @lines.keys[rand(@lines.keys.count)]
    speaker_lines = @lines[rand_speaker]
    line = speaker_lines.delete_at(rand(speaker_lines.count))
    purge_lines(rand_speaker, speaker_lines)
    line
  end

  private

  def purge_lines(speaker, speaker_lines)
    if speaker_lines.count == 0
      @lines.delete(speaker)
    else
      @lines[speaker] = speaker_lines
    end
  end

  def init_lines
    @lines = @parser.all_lines
  end
end
