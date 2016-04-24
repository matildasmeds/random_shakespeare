require 'webmock/rspec'
require_relative '../lib/random_shakespeare.rb'
require_relative '../lib/downloader.rb'
require_relative '../lib/parser.rb'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, Downloader.url).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: '<XML></XML>', headers: {})
  end
end
