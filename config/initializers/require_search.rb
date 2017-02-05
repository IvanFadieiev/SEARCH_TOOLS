Dir[Rails.root + 'lib/**/**/*.rb'].each{ |file| require file }
ActiveRecord::Base.include(Service::Search)