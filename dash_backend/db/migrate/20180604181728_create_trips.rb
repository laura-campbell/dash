class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :name
      t.string :origin
      t.string :destination
      t.date :departure_date
      t.date :return_date
      t.string :slug
      t.timestamps
    end
  end
end
