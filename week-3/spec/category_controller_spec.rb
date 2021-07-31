require './controller/category.rb'
require './models/category.rb'
require_relative "spec_helper"

describe CategoryController do
  categoryController = CategoryController.new

  context "#show categories" do
    it "show categories page" do
      result = categoryController.show_categories

      expect(result).to include(
        '<th>List of Categories</th>',
      )
    end
  end

  context "#show category by id" do
    dummyCategory = Category.new(1,'beverage')
    dummyCategory.insert
    dummyItem = Item.new(1,'Water','10000',1)
    dummyItem.insert

    it "show category page by id" do
      params = {"id" => "1"} # Due to autoincrement rule id for dummy = 1
      result = categoryController.show_categories_items(params)

      expect(result).to include(
        '<tr>
          <th>Name</th>
          <th>Price</th>
        </tr>',
      )
    end
  end
end