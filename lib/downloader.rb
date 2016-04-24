# lib/downloader.rb
require 'open-uri'
class Downloader
  URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
  FILENAME = 'lib/data/macbeth.xml'

  def initialize(filename = nil)
    @filename = filename || FILENAME
  end

  def file
    download unless File.exist? @filename
    begin
      File.open(@filename, &:read)
    rescue Exception => e
      raise "Unable to open file: #{e.inspect}"
    end
  end

  # used by spec helper
  def self.url
    URL
  end

  # used by RandomLine
  def self.filename
    @filename || FILENAME
  end

  private

  def download
    begin
      f = open(URL)
      IO.copy_stream(f, @filename)
    rescue Exception => e
      raise "Check your connection: #{e.inspect}"
    end
  end
end
