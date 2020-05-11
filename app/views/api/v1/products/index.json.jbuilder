json.product @array do |item|
  json.id item.id.to_s
  json.name item.name
  json.shop do
    json.id item.shop.id.to_s
    json.name item.shop.name
  end
end
