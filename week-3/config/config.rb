require 'mysql2'

class ClientDB
    def initialize
        client = Mysql2::Client.new(
            :host => ENV["DB_HOST"]
            :username => ENV["DB_USERNAME"]
            :database => ENV["DB_NAME"]
            :port => ENV["DB_PORT"]
        )
        client
    end
end