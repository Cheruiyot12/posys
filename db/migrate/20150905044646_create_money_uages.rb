class CreateMoneyUages < ActiveRecord::Migration
  def change
    create_table :money_uages do |t|
      t.string :transaction_date
      t.string :income
      t.string :outcome
      t.string :money_in_shop
      t.string :remark

      t.timestamps
    end
  end
end
