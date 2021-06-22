require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before(:each, :serpapi) do
    stub_request(:get, %r{https://serpapi.com/search})
      .to_return(body: File.new(File.expand_path('spec/factories/api_responses/serpapi_products.json')))

    stub_request(:get, %r{https://serpapi.com/search.json})
      .to_return(body: File.new(File.expand_path('spec/factories/api_responses/serpapi_product.json')))
  end
end
