class AddMultiplePurchaseitemTopurchasehistory < ActiveRecord::Migration
  def change
  	add_column :purchase_histories, :purchase_item1, :string
  	add_column :purchase_histories, :count1, :string, :default => 0
  	add_column :purchase_histories, :type1, :string
    add_column :purchase_histories, :item_price1, :string, :default => 0
    
  	add_column :purchase_histories, :purchase_item2, :string
  	add_column :purchase_histories, :count2, :string, :default => 0
  	add_column :purchase_histories, :type2, :string
    add_column :purchase_histories, :item_price2, :string, :default => 0

  	add_column :purchase_histories, :purchase_item3, :string
  	add_column :purchase_histories, :count3, :string, :default => 0
  	add_column :purchase_histories, :type3, :string
    add_column :purchase_histories, :item_price3, :string, :default => 0

  	add_column :purchase_histories, :purchase_item4, :string
  	add_column :purchase_histories, :count4, :string, :default => 0
  	add_column :purchase_histories, :type4, :string
    add_column :purchase_histories, :item_price4, :string, :default => 0

  	add_column :purchase_histories, :purchase_item5, :string
  	add_column :purchase_histories, :count5, :string, :default => 0
  	add_column :purchase_histories, :type5, :string
    add_column :purchase_histories, :item_price5, :string, :default => 0

  	add_column :purchase_histories, :purchase_item6, :string
  	add_column :purchase_histories, :count6, :string, :default => 0
  	add_column :purchase_histories, :type6, :string
    add_column :purchase_histories, :item_price6, :string, :default => 0

  	add_column :purchase_histories, :purchase_item7, :string
  	add_column :purchase_histories, :count7, :string, :default => 0
  	add_column :purchase_histories, :type7, :string
    add_column :purchase_histories, :item_price7, :string, :default => 0

  	add_column :purchase_histories, :purchase_item8, :string
  	add_column :purchase_histories, :count8, :string, :default => 0
  	add_column :purchase_histories, :type8, :string
    add_column :purchase_histories, :item_price8, :string, :default => 0

  	add_column :purchase_histories, :purchase_item9, :string
  	add_column :purchase_histories, :count9, :string, :default => 0
  	add_column :purchase_histories, :type9, :string
    add_column :purchase_histories, :item_price9, :string, :default => 0

    add_column :purchase_histories, :purchase_date, :string

  end
end
