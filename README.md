zipcoder
=================

Zipcoder is a geocoding solution for ruby. Instead of using an
external service (e.g. nominatim, google maps) it loads all required data from
a file (csv).

Installation
------------

Add this line to your Gemfile

    gem 'zipcoder', git: 'git://github.com/henvo/zipcoder.git'

Run bundle

    bundle install

Run rails generator to create needed migration

    rails g zipcoder:location

Migrate

    rake db:migrate

Import your data (currently only germany is available)

    rake zipcoder:import:germany


