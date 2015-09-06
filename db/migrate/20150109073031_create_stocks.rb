class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :brand
      t.string :type_id
      t.integer :pricing
      t.string :fact_type

      t.timestamps
    end
  end
end
