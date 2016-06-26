internal_geocoder
=================

Internal Geocoder is a geocoding solution for ruby. Instead of using an
external service (e.g. nominatim, google maps) it loads all required data from
a file (csv).

Installation
------------

Add this line to your Gemfile

    gem 'internal_geocoder', git: 'git://github.com/henvo/internal_geocoder.git'

Run bundle

    bundle install

Run rails generator to create needed migration

    rails g internal_geocoder:location

Migrate

    rake db:migrate

Import your data (currently only germany is available)

    rake internal_geocoder:import:germany


