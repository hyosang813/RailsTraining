json.result do
  json.user do
    json.id @item.id.to_s
    json.name @item.name
    json.message @item.message
  end
end
