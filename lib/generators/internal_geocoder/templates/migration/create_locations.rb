class CreateInternalGeocoderLocations < ActiveRecord::Migration
  def self.up
    create_table :internal_geocoder_locations do |t|
      t.column :zip_code, :string, null: false
      t.column :city, :string, null: false
      t.column :lat, :decimal, null: false, precision: 15, scale: 13
      t.column :lon, :decimal, null: false, precision: 15, scale: 13
    end
    add_index :internal_geocoder_locations, :zip_code
  end

  def self.down
    drop_table :internal_geocoder_location
  end
end
