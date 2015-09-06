class AddColumnToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :customer_id, :string
  	add_column :sales, :phone_number, :string
  end
end
