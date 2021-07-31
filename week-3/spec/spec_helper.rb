require 'sequel'
require 'database_cleaner-sequel'

RSpec.configure do |config|
  # configs ..
  
  db_host = ENV['DB_HOST']
  db_port = ENV['DB_PORT']
  db_name = ENV['DB_NAME']
  db_username = ENV['DB_USERNAME']
  uri = "mysql2://#{db_username}:#{db_password}@#{db_host}:#{db_port}/#{db_name}"
  DatabaseCleaner[:sequel].db = Sequel.connect(uri)
  DatabaseCleaner[:sequel].strategy = :truncation

  config.before(:all) do
    DatabaseCleaner[:sequel].start
    DatabaseCleaner[:sequel].clean
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].start
  end

  config.after(:each) do
    DatabaseCleaner[:sequel].clean
  end
end