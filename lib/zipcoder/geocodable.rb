module Zipcoder
  module Geocodable
    extend ActiveSupport::Concern

    included do
      scope :near, -> (lat, lon, radius) {
        select(
          "*, (
            6365 * acos (
            cos ( radians( #{lat} ) )
            * cos( radians( lat ) )
            * cos( radians( lon ) - radians( #{lon}) )
            + sin ( radians( #{lat}) )
            * sin( radians( lat ) )
            )
          ) AS distance"
        ).having("distance < #{radius}").order(:distance)
      }

      before_save :update_coordinates, if: :zip_code_changed?

      private

      def update_coordinates
        return nil if zip_code.nil?
        coords = Zipcoder.coordinates(zip_code)
        self.lat = coords[:lat]
        self.lon = coords[:lon]
      end
    end
  end
end
