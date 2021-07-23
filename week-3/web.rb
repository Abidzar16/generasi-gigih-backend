require 'sinatra'
require 'sinatra/reloader'
require_relative './db_connector'

get '/' do
    objects = get_all_items_with_categories
    erb :index, locals:{
        objects: objects
    }
end

get '/items/new' do
    categories = get_all_categories
    erb :create, locals:{
        categories: categories
    }
end

post '/items/new' do
    name = params[:name]
    price = params[:price]
    category = params[:category]
    post_an_items(name,price,category)
    redirect  "/"
end

post '/items/delete' do
    id = params[:id]
    delete_an_items(id)
    redirect  "/"
end

post '/items/edit-form' do
    id = params[:id]
    categories = get_all_categories
    item = get_spesific_item(id)
    erb :edit, locals:{
        categories: categories,
        item: item[0]
    }
end    

post '/items/edit-process' do
    id = params[:id]
    name = params[:name]
    price = params[:price]
    category = params[:category]
    edit_an_items(id,name,price,category)
    redirect  "/"
end  