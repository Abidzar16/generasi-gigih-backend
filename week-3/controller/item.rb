require './models/item'
require './models/category'
require 'ostruct'

class ItemService
    def show_spesific_items
        items = Item.get_all_items
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def show_all_items_with_categories
        items = Item.get_items_and_categories
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def create_item(params)
        item = Item.new(nil,params['name'],params['price'],params['category'])
        item.insert
        self.show_all_items_with_categories
    end

    def create_item_form
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("./views/item/create.erb"))
        renderer.result(binding)
    end

    def edit_item(params)
        changed_item = Item.new(params['id'], params['name'], params['price'], params['category'])
        changed_item.edit
        self.show_all_items_with_categories
    end

    def edit_item_form(params)
        item = Item.get_items_by_id(params['id'])
        categories = Category.get_all_categories
        combined = OpenStruct.new(item: item, categories: categories)
        renderer = ERB.new(File.read("./views/item/edit.erb"))
        renderer.result(combined.instance_eval { binding })
    end

    def delete_item(params)
        item = Item.get_items_by_id(params['id'])
        item.delete
        self.show_all_items_with_categories
    end
end