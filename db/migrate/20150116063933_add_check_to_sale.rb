class AddCheckToSale < ActiveRecord::Migration
  def change
  	 add_column :sales, :check, :boolean, :default => false
  end
end
