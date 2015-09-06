json.array!(@banks) do |bank|
  json.extract! bank, :id, :bank_transfer_date, :amount
  json.url bank_url(bank, format: :json)
end
