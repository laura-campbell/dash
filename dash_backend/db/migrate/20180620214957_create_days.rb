class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.integer :trip_id
      t.string :day
      t.string :description
      t.timestamps
    end
  end
end
