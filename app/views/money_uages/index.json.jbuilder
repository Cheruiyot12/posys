json.array!(@money_uages) do |money_uage|
  json.extract! money_uage, :id, :transaction_date, :income, :outcome, :money_in_shop, :remark
  json.url money_uage_url(money_uage, format: :json)
end
