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
  end
end
