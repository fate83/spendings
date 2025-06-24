json.items @items do |item|
  json.name item.name
  json.price item.price
  json.category item.category.name
end
