module InternalGeocoder
  class Lookup
    def find_by_address(query)
      { lat: 0, lon: 0 }
    end

    def find_by_zip_code(query)
      InternalGeocoder::Location.where(zip_code: query.to_s)
    end

    def find_by_city(query)
      InternalGeocoder::Location.where(city: query.to_s)
    end
  end
end
