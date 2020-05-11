json.result do
  json.article @array do |item|
    json.id item.id.to_s
    json.title item.title
  end
end
