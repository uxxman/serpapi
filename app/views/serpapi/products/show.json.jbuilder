json.id @product.id
json.title @product.title
json.price @product.price
json.image @product.image
json.rating @product.rating
json.source @product.source
json.description @product.description

if @product.merchants.length.positive?
  json.merchants do
    json.array! @product.merchants do |merchant|
      json.id merchant.id
      json.url merchant.url
      json.name merchant.name
      json.unit merchant.unit
      json.price merchant.price
      json.amount merchant.amount
      json.expected_price merchant.expected_price
    end
  end
end
