require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before(:each, :serpapi_products) do
    stub_request(:get, %r{https://www.searchapi.io/api/v1})
      .to_return(body: File.new(File.expand_path('spec/factories/api_responses/serpapi_products.json')))
  end

  config.before(:each, :serpapi_product_details) do
    stub_request(:get, %r{https://www.searchapi.io/api/v1})
      .to_return(body: File.new(File.expand_path('spec/factories/api_responses/serpapi_product.json')))
  end
end
