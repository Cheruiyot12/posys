class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :bank_transfer_date
      t.string :amount
  	  t.string :supplier

      t.timestamps
    end
  end
end
