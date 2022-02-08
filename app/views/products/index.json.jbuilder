json.items do
  json.array! @products do |product|
    json.id product.id
    json.title product.title
    json.price product.price
    json.image product.image
    json.rating product.rating
    json.source product.source
    json.description product.description
  end
end
