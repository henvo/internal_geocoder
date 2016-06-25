module InternalGeocoder
  class LocationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    include Rails::Generators::Migration

    def copy_migration_files
      migration_template 'migration/create_locations.rb', 'db/migrate/internal_geocoder_create_locations.rb'
    end
  end
end
