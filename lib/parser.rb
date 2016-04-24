require 'nokogiri'
require_relative 'downloader'
require 'active_support/core_ext/string/inflections.rb'
class Parser
  def initialize(filename)
    if File.exist? (filename)
      file = File.open(filename, &:read)
    else
      file = Downloader.new.file
    end
    @doc = Nokogiri::XML(file)
  end

  def lines_by_speaker(speaker)
    all_lines[speaker.titleize]
  end

  def all_lines
    return @all_lines unless @all_lines.nil? || @all_lines.empty?
    ret = {}
    @doc.xpath('//SPEECH').each do |speech_doc|
      speaker = speech_doc.xpath('SPEAKER').text.titleize
      lines = speech_doc.xpath('LINE').map(&:text)
      ret[speaker] ||= []
      ret[speaker] << lines.join("\n")
    end
    @all_lines = ret
  end

  # convenience methods

  def total_lines
    all_lines.values.flatten.count
  end

  def speakers
    all_lines.keys
  end
end
