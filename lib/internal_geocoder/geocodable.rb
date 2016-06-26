module InternalGeocoder
  module Geocodable
    extend ActiveSupport::Concern

    included do
      scope :near, -> { where(city: 'Berlin') }
    end
  end
end
