require 'bundler/setup'
require 'active_record'
Bundler.setup

require 'internal_geocoder'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load File.dirname(__FILE__) + '/schema.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
