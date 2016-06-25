require 'csv'

namespace :internal_geocoder do
  desc 'import geolocations from csv'
  task :import => :environment do
    puts 'Es funktioniert!'
  end
end
