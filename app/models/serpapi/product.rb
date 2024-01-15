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

    def seller
      @json['seller']
    end

    def rating
      @json['rating']
    end

    def description
      @json['description']
    end

    def image
      @image ||= @json['thumbnail'] || @json.dig('images', 0)
    end

    def price
      @price ||= @json['extracted_price'] || merchants.first&.price
    end

    def currency
      @currency ||= Currencies[@json['price']&.scan(/€|$/)&.first] || merchants.first&.currency
    end

    def valid?
      @json.present? && id.present?
    end
  end
end
