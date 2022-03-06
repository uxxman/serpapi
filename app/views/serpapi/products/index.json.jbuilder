json.items do
  json.array! @products, partial: 'serpapi/products/product', as: :product
end
