module Serpapi
  class Client
    BASE_URL = 'https://serpapi.com'.freeze

    def products(query:, locale: 'en')
      response = connection.get('search') do |req|
        req.params = params.merge(q: query, hl: locale, engine: 'google')
      end

      list = JSON.parse(response.body)['shopping_results'] || []

      list.filter_map { |p| Product.new(p) unless p['product_id'].nil? }.take(10)
    end

    def product_details(id, locale: 'en')
      response = connection.get('search.json') do |req|
        req.params = params.merge(product_id: id, hl: locale, engine: 'google_product')
      end

      json = JSON.parse(response.body)

      product = Product.new(json['product_results'])
      product.merchants = (json.dig('sellers_results', 'online_sellers') || []).map { |m| Merchant.new(m) }

      product
    end

    private

    def connection
      @connection ||= Faraday.new(BASE_URL)
    end

    def params
      {
        num: 10,
        filter: 0,
        tbm: 'shop',
        safe: 'active',
        api_key: Serpapi.config.api_key,
        gl: Serpapi.config.location_code,
        location: Serpapi.config.location,
        google_domain: Serpapi.config.domain
      }
    end
  end
end
