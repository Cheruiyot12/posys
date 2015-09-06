class AddPurchaseItemInformationToSales < ActiveRecord::Migration
  def change
    add_column :sales, :name, :string
    add_column :sales, :count, :integer
    add_column :sales, :status, :string
    add_column :sales, :item_price, :integer
  end
end
