class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :contact
      t.string :debit

      t.timestamps
    end
  end
end
