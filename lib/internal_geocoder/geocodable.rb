module InternalGeocoder
  module Geocodable
    extend ActiveSupport::Concern

    included do
      scope :near, -> (lat, lon, radius) {
        select(
          "id, (
            3959 * acos (
            cos ( radians(78.3232) )
            * cos( radians( #{lat} ) )
            * cos( radians( #{lon} ) - radians(65.3234) )
            + sin ( radians(78.3232) )
            * sin( radians( #{lat} ) )
            )
          ) AS distance"
        ).having("distance < #{radius}")
      )}
    end
  end
end
