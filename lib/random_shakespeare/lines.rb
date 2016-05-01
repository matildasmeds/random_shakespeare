require_relative 'parser.rb'
require_relative 'downloader.rb'
module RandomShakespeare
  class Lines
    def initialize(parser = nil)
      @parser = parser || Parser.new(Downloader::FILENAME)
      load_lines!
    end

    def next
      load_lines! if lines_empty?
      random_line
    end

    private

    def random_line
      rand_speaker = @lines.keys[rand(@lines.keys.count)]
      speaker_lines = @lines[rand_speaker]
      line = speaker_lines.delete_at(rand(speaker_lines.count))
      clean_up(rand_speaker, speaker_lines)
      line
    end

    def clean_up(speaker, speaker_lines)
      if speaker_lines.count == 0
        @lines.delete(speaker)
      else
        @lines[speaker] = speaker_lines
      end
    end

    def lines_empty?
      @lines == {}
    end

    def load_lines!
      @lines = @parser.all_lines
    end
  end
end
