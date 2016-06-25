require 'csv'
require 'open-uri'

namespace :internal_geocoder do
  desc 'import geolocations from csv'
  namespace :import do
    task :germany => :environment do
      open('https://raw.githubusercontent.com/henvo/geodata/master/germany.csv') do |data|
        data.read.each_line do |row, index|
          next if index == 0
          location = row.split(',')
          InternalGeocoder::Location.create!(
            zip_code: location[0],
            lon: location[1],
            lat: location[2],
            city: location[3]
          )
        end
      end
    end
  end
end
