class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :name
      t.string :start_date
      t.string :end_date
      t.timestamps
    end
  end
end
