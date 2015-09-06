class AddStockArrivalDateToPurchase < ActiveRecord::Migration
  def change
  	   add_column :purchase_histories, :stock_arrival_date, :string
  end
end
