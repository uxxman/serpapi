module Serpapi
  class Merchant
    attr_accessor :unit, :url, :amount, :offer_id

    def initialize(json)
      @json = json
    end

    def id
      @json['position']
    end

    def link
      @json['link']
    end

    def name
      @json['name']
    end

    def price
      @price ||= @json['total_price'].gsub(/\D/, '').to_d / 100
    end

    def currency_symbol
      @currency_symbol ||= @json['total_price'].scan(/€|$/).first
    end

    def currency
      @currency ||= CurrencyMapper::SYMBOLS[currency_symbol] || 'EUR'
    end

    def valid?
      name.present? && link.present? && @json['total_price'].present?
    end

    def cashback?
      offer_id.present?
    end

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end

    def expected_price
      return price if amount.nil? || unit.nil?

      case unit
      when '%'
        price - (price * amount / 100).round(2)
      else
        price - amount
      end
    end
  end
end
