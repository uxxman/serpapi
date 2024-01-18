module Serpapi
  class Client
    BASE_URL = 'https://www.searchapi.io/api/v1'.freeze

    def products(query:, locale: 'en')
      response = connection.get('search') do |req|
        req.params = params.merge(q: query, hl: locale, engine: 'google_shopping')
      end

      list = (JSON.parse(response.body)['shopping_results'] || []).map { |p| Product.new(p) }

      list.filter(&:valid?).sort_by(&:price)
    end

    def product_details(id, locale: 'en')
      response = connection.get('search') do |req|
        req.params = params.merge(product_id: id, hl: locale, engine: 'google_product')
      end

      json    = JSON.parse(response.body)
      product = Product.new(json['product'])
      raise Error::ProductNotFound unless product.valid?

      product.merchants = merchants(json['offers'] || [])

      product
    end

    private

    def merchants(data)
      list = data.map { |m| Merchant.new(m) }

      list
        .select(&:valid?)
        .sort_by(&:expected_price)
        .take(5)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL)
    end

    def params
      {
        num: 15,
        api_key: Serpapi.config.api_key,
        gl: Serpapi.config.location_code,
        location: Serpapi.config.location,
        google_domain: Serpapi.config.domain
      }
    end
  end
end
