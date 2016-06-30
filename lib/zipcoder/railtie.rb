module Zipcoder
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/zipcoder.rake'
    end
  end
end
