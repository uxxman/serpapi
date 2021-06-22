module Serpapi
  class ProductListService < ApplicationService
    attribute :user
    attribute :query, :string

    validates :query, presence: true
    validates :user, presence: true

    def perform
      client = Serpapi::Client.new

      client.products(query: query, locale: user.locale)
    end
  end
end
