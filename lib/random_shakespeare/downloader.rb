# lib/downloader.rb
require 'open-uri'
module RandomShakespeare
  class Downloader
    URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
    FILENAME = 'lib/random_shakespeare/data/macbeth.xml'

    def initialize(filename = nil)
      @filename = filename || FILENAME
    end

    def file
      download unless File.exist? @filename
      open_file
    end

    def self.url
      URL
    end

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

    def open_file
      begin
        File.open(@filename, &:read)
      rescue Exception => e
        raise "Unable to open file: #{e.inspect}"
      end
    end
  end
end
