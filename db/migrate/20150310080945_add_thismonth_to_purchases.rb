class AddThismonthToPurchases < ActiveRecord::Migration
  def change
  	  add_column :purchase_histories, :thismonth, :string
  end
end
