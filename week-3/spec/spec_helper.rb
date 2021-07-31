require 'sequel'
require 'database_cleaner-sequel'
require 'dotenv/load'

RSpec.configure do |config|
  # configs ..
  
  db_host = ENV['DB_HOST']
  db_port = ENV['DB_PORT']
  db_name = ENV['DB_NAME']
  db_username = ENV['DB_USERNAME']
  uri = "mysql2://#{db_username}@#{db_host}:#{db_port}/#{db_name}"
  DB = Sequel.connect(uri)
  DatabaseCleaner[:sequel].db = DB
  DatabaseCleaner[:sequel].strategy = :truncation

  config.before(:all) do
    DB.run('SET FOREIGN_KEY_CHECKS=0;')
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner[:sequel].start
    DatabaseCleaner[:sequel].clean
    DB.run('SET FOREIGN_KEY_CHECKS=1;')
  end

  config.before(:each) do
    DB.run('SET FOREIGN_KEY_CHECKS=0;')
    DatabaseCleaner.clean_with :truncation
    DB.run('SET FOREIGN_KEY_CHECKS=1;')
  end

  config.after(:each) do
    DB.run('SET FOREIGN_KEY_CHECKS=0;')
    DatabaseCleaner.clean_with :truncation
    DB.run('SET FOREIGN_KEY_CHECKS=1;')
  end
end