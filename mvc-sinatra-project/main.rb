require 'sinatra'
require_relative './model/order'

get path '/' do
    orders = Order.get_all_orders
    erb :index, locals:
end

get path '/order/new' do
    erb :create_order
end

post path '/order' do
    new_order = Order.new(
        params["ref_no"], params["cust_name"], params["date"]
    )
    new_order.save
    redirect '/'
end