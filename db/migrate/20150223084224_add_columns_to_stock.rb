class AddColumnsToStock < ActiveRecord::Migration
  def change
  	 add_column :stocks, :item_price, :integer, :default => 0
  	 add_column :stocks, :wholesale_price, :integer, :default => 0
  end
end
