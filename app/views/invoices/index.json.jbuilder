json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :invoice_number, :customer_name, :phone_number, :payment_type, :purchase_item
  json.url invoice_url(invoice, format: :json)
end
