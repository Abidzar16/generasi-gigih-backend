require 'sinatra'
require 'sinatra/reloader'
require_relative './db/db_connector'
require_relative './controller/item'
require_relative './controller/category'

categoryController = CategoryController.new
itemService = ItemService.new

get '/' do
    itemService.show_all_items_with_categories
end

get '/items/new' do
    itemService.create_item_form
end

post '/items/new' do
    itemService.create_item(params)
end

post '/items/delete' do
    itemService.delete_item(params)
end

post '/items/edit-form' do
    itemService.edit_item_form(params)
end    

post '/items/edit-process' do
    itemService.edit_item(params)
end

get '/category' do
    categoryController.show_categories
end

get '/category/new' do
    categoryController.create_category_form
end

post '/category/new' do
    categoryController.create_category(params)
end

get '/category/details' do
    categoryController.show_categories_items(params)
end

post '/category/delete' do
    categoryController.delete_category(params)
end

post '/category/edit-process' do
    categoryController.edit_category(params)
end

get '/category/edit-form' do
    categoryController.edit_category_form(params)
end