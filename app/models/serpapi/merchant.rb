module Serpapi
  class Merchant
    attr_reader :name, :price

    attr_accessor :unit, :url, :amount

    def initialize(json)
      @url   = json['link']
      @name  = json['name']
      @price = json['total_price']
    end
  end
end
