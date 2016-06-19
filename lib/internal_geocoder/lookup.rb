module InternalGeocoder
  class Lookup
    def find_by_address(query)
      { lat: 0, lon: 0 }
    end

    def find_by_zip_code(query)
      { lat: 0, lon: 0 }
    end

    def find_by_city(query)
      { lat: 0, lon: 0 }
    end
  end
end
