module InternalGeocoder
  module Geocodable
    extend ActiveSupport::Concern

    included do
      scope :near, -> (lat, lon, radius) {
        select(
          "id, (
            6365 * acos (
            cos ( radians( #{lat} ) )
            * cos( radians( lat ) )
            * cos( radians( lon ) - radians( #{lon}) )
            + sin ( radians( #{lat}) )
            * sin( radians( lat ) )
            )
          ) AS distance"
        ).having("distance < #{radius}")
      }

      before_save :update_coordinates, if :zip_code_changed?

      private

      def update_coordinates
        return nil if zip_code.nil?
        lat, lon = InternalGeocoder.coordinates(zip_code)
      end
    end
  end
end
