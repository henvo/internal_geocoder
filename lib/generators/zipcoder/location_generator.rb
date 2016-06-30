module Zipcoder
  class LocationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    include Rails::Generators::Migration

    def copy_migration_files
      migration_template 'migration/create_locations.rb', 'db/migrate/create_zipcoder_locations.rb'
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        raise NotImplementedError
      end
    end
  end
end
