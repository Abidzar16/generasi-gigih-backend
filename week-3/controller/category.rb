require './models/item'
require './models/category'

class CategoryController
    def show_categories
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("./views/category/index.erb"))
        renderer.result(binding)
    end

    def show_categories_items(params)
        items = Item.get_spseific_items(id: params['id'])
        renderer = ERB.new(File.read("./views/category/details.erb"))
        renderer.result(binding)
    end

    def create_category(params)
        category = Category.new(name: params['name'])
        category.insert
        renderer = ERB.new(File.read("./views/category/form.erb"))
        renderer.result(binding)
    end

    def create_category_form
        renderer = ERB.new(File.read("./views/category/form.erb"))
        renderer.result(binding)
    end

    def edit_category
        category = Category.new(id: params['id'], name: params['name'])
        category.edit
        renderer = ERB.new(File.read("./views/category/form.erb"))
        renderer.result(binding)
    end

    def edit_category_form
        renderer = ERB.new(File.read("./views/category/form.erb"))
        renderer.result(binding)
    end

    def delete_category
        category = Category.new(id: params['id'])
        category.delete
        renderer = ERB.new(File.read("./views/category/index.erb"))
        renderer.result(binding)
    end
end    