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

      sym  = price.scan(/€|$/).first
      cost = @price.remove('€', '$').to_d

      case unit
      when '%'
        "#{sym}#{cost - (cost * amount / 100)}"
      else
        "#{sym}#{cost - amount}"
      end
    end
  end
end
