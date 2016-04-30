require 'nokogiri'
require_relative 'downloader'
require 'active_support/core_ext/string/inflections.rb'
module RandomShakespeare
  class Parser
    def initialize(filename)
      file = get_file(filename)
      @doc = Nokogiri::XML(file)
    end

    def all_lines
      return @all_lines if doc_parsed?
      @all_lines = parse_doc
    end

    def total_lines
      all_lines.values.flatten.count
    end

    def lines_by_speaker(speaker)
      all_lines[speaker.titleize]
    end

    def speakers
      all_lines.keys
    end

    private

    def get_file(filename)
      filename = File.join(File.expand_path('.'), filename)
      if File.exist? (filename)
        File.open(filename, &:read)
      else
        Downloader.new.file
      end
    end

    def doc_parsed?
      !@all_lines.nil? && !@all_lines.empty?
    end

    def parse_doc
      ret = {}
      @doc.xpath('//SPEECH').each do |speech_doc|
        parse_speech_doc(ret, speech_doc)
      end
      ret
    end

    def parse_speech_doc(ret, speech_doc)
      speaker = speech_doc.xpath('SPEAKER').text.titleize
      ret[speaker] ||= []
      lines = speech_doc.xpath('LINE').map(&:text)
      ret[speaker] << lines.join("\n")
    end
  end
end
