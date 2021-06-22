module Serpapi
  class MerchantSerializer < ApplicationSerializer
    serialize(
      :name,
      :unit,
      :price,
      :amount,
      :url
    )
  end
end
