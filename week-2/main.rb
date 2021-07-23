require 'sinatra'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080


get '/' do
  File.read(File.join('public', 'index.html'))
end

post '/insert' do
  "Hello #{params["item"]}!"
end  