class CreatePackingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :packing_lists do |t|
      t.integer :trip_id
      t.string :name
      t.timestamps
    end
  end
end
