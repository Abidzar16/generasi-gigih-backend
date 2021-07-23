require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => ENV["DB_HOST"]
        :username => ENV["DB_USERNAME"]
        :database => ENV["DB_NAME"]
        :port => ENV["DB_PORT"]
    )
    client
end