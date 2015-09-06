json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :contact
  json.url customer_url(customer, format: :json)
end
