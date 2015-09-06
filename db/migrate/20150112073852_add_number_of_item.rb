class AddNumberOfItem < ActiveRecord::Migration
  def change
    add_column :stocks, :number_of_item, :integer
    add_column :stocks, :purchase_price, :integer
  end
end
