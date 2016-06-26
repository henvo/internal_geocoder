require 'csv'
require 'open-uri'

namespace :internal_geocoder do
  desc 'import geolocations from csv'
  namespace :import do
    task :germany => :environment do
      open('https://raw.githubusercontent.com/henvo/geodata/master/germany.csv') do |data|
        data.read.each_line do |row, index|
          next if index == 0
          row_data = row[0..-2].split(',')
          location = InternalGeocoder::Location.new(
            zip_code: row_data[0],
            lon: row_data[1],
            lat: row_data[2],
            city: row_data[3]
          )
          if location.save!
            puts "#{index} zip codes imported"
          else
            puts "Could not save: #{row}"
          end
        end
      end
    end
  end
end
