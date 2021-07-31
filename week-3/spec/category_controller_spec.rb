require './controller/category.rb'

describe CategoryController do
  categoryController = CategoryController.new

  context "show categories" do
    it "show categories page" do
      result = categoryController.show_categories

      expect(result).to include(
        '<form action="/category/details" method="GET">',
      )
    end
  end

  context "show category by id" do
    it "show category page by id" do
      params = {"id" => "2"}
      result = categoryController.show_categories_items(params)

      expect(result).to include(
        '<form action="/items/delete" method="POST">',
      )
    end
  end
end