class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact
      t.string :to_give
      t.string :to_get

      t.timestamps
    end
  end
end
