module Serpapi
  class MerchantSerializer < ApplicationSerializer
    serialize(
      :id,
      :url,
      :name,
      :unit,
      :price,
      :amount
    )
  end
end
