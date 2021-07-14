module Serpapi
  class Product
    attr_reader :id, :title, :source, :price, :image, :rating, :description

    attr_accessor :merchants

    def initialize(json)
      @id          = json['product_id']
      @title       = json['title']
      @image       = json['thumbnail'] || json.dig('media', 0, 'link')
      @price       = (json['price'] || json.dig('prices', 0)).to_s.split(' ').first
      @rating      = json['rating']
      @source      = json['source']
      @merchants   = []
      @description = json['description']
    end
  end
end
