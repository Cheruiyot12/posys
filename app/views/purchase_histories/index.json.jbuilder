json.array!(@purchase_histories) do |purchase_history|
  json.extract! purchase_history, :id, :supplier_id, :phone, :payment, :purchase_item, :count, :voucher_no
  json.url purchase_history_url(purchase_history, format: :json)
end
