class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :wish

      t.timestamps null: false
    end

    add_index :locations, :wish_id
  end
end
