module Serpapi
  class Product
    attr_reader :id, :title, :source, :price, :image, :rating, :description

    attr_accessor :merchants

    def initialize(json)
      @id          = json['product_id']
      @title       = json['title']
      @price       = json['price'] || json.dig('prices', 0)
      @image       = json['thumbnail'] || json.dig('media', 0, 'link')
      @rating      = json['rating']
      @source      = json['source']
      @merchants   = []
      @description = json['description']
    end
  end
end
