class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :store, index: true
      t.decimal :latitude, precision: 9, scale: 6, index: true
      t.decimal :longitude, precision: 9, scale: 6, index: true
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
