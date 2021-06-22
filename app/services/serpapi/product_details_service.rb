module Serpapi
  class ProductDetailsService < ApplicationService
    attribute :user
    attribute :id, :string

    validates :id, presence: true
    validates :user, presence: true

    def perform
      client  = Serpapi::Client.new
      product = client.product_details(id, locale: user.locale)

      product.merchants.each do |merchant|
        Serpapi.config.update_merchant.call(merchant, user)
      end

      product
    end
  end
end
