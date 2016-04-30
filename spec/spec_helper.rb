$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'random_shakespeare'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, RandomShakespeare::Downloader.url).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: '<XML></XML>', headers: {})
  end
end
