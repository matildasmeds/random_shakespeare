# spec/downloader_spec.rb
require 'spec_helper.rb'
RSpec.describe Downloader, type: :model do
  FILENAME = '/tmp/downloader_spec.out'

  context '#file' do
    let(:downloader) { Downloader.new(FILENAME) }
    after(:each) { delete_file }

    it 'returns file contents as string' do
      expect(downloader.file).to be_instance_of(String)
    end

    it 'downloads file when file does not exist' do
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
    File.delete(FILENAME)
  end

  def have_downloaded(times)
    have_requested(:get, Downloader.url).send(times)
  end
end
