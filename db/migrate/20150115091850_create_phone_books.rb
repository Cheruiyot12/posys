class CreatePhoneBooks < ActiveRecord::Migration
  def change
    create_table :phone_books do |t|
      t.string :name
      t.string :phone
      t.string :company

      t.timestamps
    end
  end
end
