module Zipcoder
  class Lookup
    def find_by_address(query)
      address = query.to_s.split(' ')
      find_by({zip_code: address[0], city: address[1]})
    end

    def find_by_zip_code(query)
      find_by({zip_code: query.to_s})
    end

    def find_by_city(query)
      find_by({city: query.to_s})
    end

    private

    def find_by(hash)
      coords = Zipcoder::Location.where(hash)
                                 .pluck(:lat, :lon)

      return nil if coords.empty?
      return { lat: coords.first[0], lon: coords.first[1] }
    end
  end
end