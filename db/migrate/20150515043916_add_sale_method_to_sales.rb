class AddSaleMethodToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :sale_method, :string
  	add_column :sales, :sale_name, :string
  end
end
