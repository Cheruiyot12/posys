json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :brand_id, :type_id, :pricing
  json.url stock_url(stock, format: :json)
end
