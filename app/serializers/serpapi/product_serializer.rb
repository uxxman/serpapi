module Serpapi
  class ProductSerializer < ApplicationSerializer
    serialize(
      :id,
      :title,
      :price,
      :image,
      :rating,
      :source,
      :desciption
    )

    show_if :merchants? do
      serialize :merchants, with: MerchantSerializer
    end

    def merchants?
      model.merchants.length.positive?
    end
  end
end
