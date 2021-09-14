module Serpapi
  class Merchant
    attr_reader :id, :name, :price

    attr_accessor :unit, :url, :amount

    def initialize(json)
      @id    = json['position']
      @url   = json['link']
      @name  = json['name']
      @price = json['total_price'].split(' ').first
    end

    def expected_price
      return @price if amount.nil? || unit.nil?

      cost_str, symbol = @price.split

      cost = cost_str.to_d

      case unit
      when '%'
        "#{cost - (cost * amount / 100)} #{symbol}"
      else
        "#{cost - amount} #{symbol}"
      end
    end
  end
end
