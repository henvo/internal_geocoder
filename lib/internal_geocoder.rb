require 'internal_geocoder/query'
require 'internal_geocoder/lookup'
require 'internal_geocoder/location'

module InternalGeocoder
  def self.coordinates(text)
    query = Query.new(text)
    lookup = Lookup.new
    return lookup.find_by_address(query) if query.address_query?
    return lookup.find_by_zip_code(query) if query.zip_code_query?
    return lookup.find_by_city(query) if query.city_query?
    nil
  end

  def self.table_name_prefix
    "#{ActiveRecord::Base.table_name_prefix}internal_geocoder_"
  end
end
