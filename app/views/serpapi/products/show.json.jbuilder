json.partial! 'serpapi/products/product', product: @product

json.merchants do
  json.array! @product.merchants, partial: 'serpapi/merchants/merchant', as: :merchant
end
