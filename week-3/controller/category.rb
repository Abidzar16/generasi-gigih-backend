require './models/item'
require './models/category'

class CategoryController
    def show_categories
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("./views/category/index.erb"))
        renderer.result(binding)
    end

    def show_categories_items(params)
        items = Item.get_spesific_items(id: params['id'])
        renderer = ERB.new(File.read("./views/category/details.erb"))
        renderer.result(binding)
    end

    def create_category(params)
        category = Category.new(nil, params['name'])
        category.insert
        self.show_categories
    end

    def create_category_form
        renderer = ERB.new(File.read("./views/category/form.erb"))
        renderer.result(binding)
    end

    def edit_category(params)
        category = Category.new(params['id'],params['name'])
        category.edit
        self.show_categories
    end

    def edit_category_form(params)
        category = Category.get_by_id(params['id'])
        renderer = ERB.new(File.read("./views/category/edit.erb"))
        renderer.result(binding)
    end

    def delete_category(params)
        category = Category.new(params['id'],nil)
        category.delete
        self.show_categories
    end
end    