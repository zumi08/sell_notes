json.array!(@items) do |item|
  json.extract! item, :id, :title, :detail, :email, :price
  json.url item_url(item, format: :json)
end
