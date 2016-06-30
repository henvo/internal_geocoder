ActiveRecord::Schema.define do
  self.verbose = false

  create_table :zipcoder_locations, :force => true do |t|
    t.string :zip_code
    t.string :city
    t.decimal :lat
    t.decimal :lon
  end
end
