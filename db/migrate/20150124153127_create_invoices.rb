class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.string :customer_name
      t.string :phone_number
      t.string :payment_type
      t.string :purchase_item
      t.string :sale_id
      t.string :invoice_status
      t.string :count
      t.integer :item_price

      t.timestamps
    end
  end
end
