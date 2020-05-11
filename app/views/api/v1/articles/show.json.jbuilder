json.result do
  json.id @item.id.to_s
  json.title @item.title
  json.text @item.text
  json.user do
    json.id @item.user.id.to_s
    json.name @item.user.name
  end
end
