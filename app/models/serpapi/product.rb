module Serpapi
  class Product
    attr_accessor :merchants

    def initialize(json)
      @json = json
      @merchants = []
    end

    def id
      @json['product_id']
    end

    def title
      @json['title']
    end

    def source
      @json['source']
    end

    def rating
      @json['rating']
    end

    def description
      @json['description']
    end

    def image
      @image ||= @json['thumbnail'] || @json.dig('media', 0, 'link')
    end

    def price
      @price ||= (@json['price'] || @json.dig('prices', 0)).gsub(/\D/, '').to_d / 100
    end

    def currency_symbol
      @currency_symbol ||= (@json['price'] || @json.dig('prices', 0)).scan(/€|$/).first
    end

    def currency
      @currency ||= CurrencyMapper::SYMBOLS[currency_symbol] || 'EUR'
    end

    def valid?
      id.present?
    end

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end
  end
end
