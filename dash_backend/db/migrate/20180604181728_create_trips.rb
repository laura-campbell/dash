class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :name
      t.string :origin
      t.string :destination
      t.string :outboundDepartureCity
      t.string :outboundArrivalCity
      t.string :outboundDepartureDate
      t.string :outboundAirline
      t.string :outboundDepartureTime
      t.string :returnDepartureCity
      t.string :returnArrivalCity
      t.string :returnDepartureDate
      t.string :returnAirline
      t.string :returnDepartureTime
      t.timestamps
    end
  end
end
