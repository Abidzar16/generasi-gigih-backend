require 'sinatra'
require 'sinatra/reloader'
require_relative './db/db_connector'
require_relative './controller/item'
require_relative './controller/category'

categoryController = CategoryController.new

get '/' do
    itemService = ItemService.new
    itemService.show_all_items_with_categories
end

get '/items/new' do
    itemService = ItemService.new
    itemService.create_item_form
end

post '/items/new' do
    itemService = ItemService.new
    itemService.create_item(params)
end

post '/items/delete' do
    itemService = ItemService.new
    itemService.delete_item(params)
end

post '/items/edit-form' do
    itemService = ItemService.new
    itemService.edit_item_form(params)
end    

post '/items/edit-process' do
    itemService = ItemService.new
    itemService.edit_item(params)
end

get '/category' do
    categoryController.show_categories
end

get '/category/new' do
    categoryController.create_item_form
end

post '/category/new' do
    categoryController.create_item(params)
end

get '/category/details' do
    categoryController.show_categories_items(params)
end