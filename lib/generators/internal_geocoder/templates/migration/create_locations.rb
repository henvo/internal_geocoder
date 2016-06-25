class CreateInternalGeocoderLocations < ActiveRecord::Migration
  def self.up
    create_table :internal_geocoder_locations do |t|
      t.column :zip_code, :string, null: false
      t.column :city, :string, null: false
      t.column :lat, :decimal, null: false
      t.column :lon, :decimal, null: false
    end
  end

  def self.down
    drop_table :internal_geocoder_location
  end
end
