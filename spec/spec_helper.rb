require 'bundler/setup'
Bundler.setup

require 'internal_geocoder'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
