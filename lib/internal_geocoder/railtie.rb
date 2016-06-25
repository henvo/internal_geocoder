module InternalGeocoder
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/internal_geocoder.rake'
    end
  end
end
