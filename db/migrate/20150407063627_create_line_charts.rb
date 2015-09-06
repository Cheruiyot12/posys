class CreateLineCharts < ActiveRecord::Migration
  def change
    create_table :line_charts do |t|
      t.string :month_name
      t.string :year
      t.string :total_income

      t.timestamps
    end
  end
end
