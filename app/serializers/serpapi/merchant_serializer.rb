module Serpapi
  class MerchantSerializer < ApplicationSerializer
    serialize(
      :id,
      :url,
      :name,
      :unit,
      :price,
      :amount,
      :expected_price
    )
  end
end
