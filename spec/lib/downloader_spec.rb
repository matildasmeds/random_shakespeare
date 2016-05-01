require 'spec_helper.rb'
require 'uri'
RSpec.describe RandomShakespeare::Downloader, type: :model do
  FILENAME = '/tmp/downloader_spec.out'

  describe '::URL' do
    specify do
      expect(URI(RandomShakespeare::Downloader::URL)).to be_kind_of(URI::HTTP)
    end
  end

  describe '::FILENAME' do
    specify do
      expect(RandomShakespeare::Downloader::FILENAME).to be_kind_of(String)
    end
  end

  describe '#file' do
    let(:downloader) { RandomShakespeare::Downloader.new(FILENAME) }
    before(:each) { delete_file }
    after(:all) { delete_file }

    it 'returns file content as string' do
      expect(downloader.file).to be_instance_of(String)
    end

    it 'downloads file if file does not exist' do
      downloader.file
      expect(WebMock).to have_downloaded(:once)
    end

    it 'does not download file again, if file exists' do
      downloader.file
      expect(WebMock).to have_downloaded(:once)
      downloader.file
      expect(WebMock).to have_downloaded(:once)
    end
  end

  private

  def delete_file
    File.delete(FILENAME) if File.exist? FILENAME
  end

  def have_downloaded(times)
    have_requested(:get, RandomShakespeare::Downloader::URL).send(times)
  end
end
