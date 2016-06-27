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
    end
  end
end
