class CreateRawMaterials < ActiveRecord::Migration
  def change
    create_table :raw_materials do |t|
      t.string :name
      t.string :price
      t.string :count

      t.timestamps
    end
  end
end
