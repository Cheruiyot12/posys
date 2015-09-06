class CreatePurchaseHistories < ActiveRecord::Migration
  def change
    create_table :purchase_histories do |t|
      t.integer :supplier_id
      t.string :phone
      t.string :payment
      t.string :purchase_item
      t.integer :count, :default => 0
      t.string :voucher_no
      t.integer :brand_id
      t.integer :type_id
      t.integer :item_price, :default => 0
      t.integer :total_cash
      t.string :new_purchase_item

      t.timestamps
    end
  end
end
