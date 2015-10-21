class AddGeocodedLocationToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :geocoded_location, :string
  end
end
