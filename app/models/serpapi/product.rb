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
      @price ||= (@json['price'] || @json.dig('prices', 0)).scan(/(\d+[.,]\d+)/).flatten.first.tr(',', '.').to_f
    end

    def currency_symbol
      @currency_symbol ||= (@json['price'] || @json.dig('prices', 0)).scan(/€|$/).first
    end

    def currency
      @currency ||= CurrencyMapper::SYMBOLS[currency_symbol] || 'EUR'
    end

    def valid?
      @json.present? && id.present?
    end
  end
end
