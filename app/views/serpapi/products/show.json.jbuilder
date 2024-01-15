json.partial! 'serpapi/products/product', product: @product

json.description @product.description

json.merchants do
  json.array! @product.merchants, partial: 'serpapi/merchants/merchant', as: :merchant
end
