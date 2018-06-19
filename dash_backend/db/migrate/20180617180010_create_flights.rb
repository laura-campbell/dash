class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :trip_id
      t.string :departure_terminal
      t.string :arrival_airport
      t.string :arrival_time
      t.string :airline
      t.string :departure_airport
      t.string :departure_time
      t.string :flight_number
      t.integer :stops
      t.timestamps
    end
  end
end
