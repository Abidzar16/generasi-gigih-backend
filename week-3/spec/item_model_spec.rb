require './models/item.rb'
require_relative "spec_helper"

describe Item do
  describe '#get_items_and_categories' do
    let(:testing) {Item.get_items_and_categories}

    it 'return all items and related categories' do
      expect(testing.size).to be > 0
    end

  end

  describe '#get_items_by_id' do
    dummyItem = Item.new(1,'Ice_Water',1500,1)
    dummyItem.insert
    let(:testing) {Item.get_items_by_id(1)} # Due to autoincrement rule id for dummy = 1

    it 'return item by id accurately' do
      expect(testing.id).to eq(equal.id)
      expect(testing.name).to eq(equal.name)
      expect(testing.price).to eq(equal.price)
    end
  end

  # describe '#insert' do
  #   category = Category.new(nil,'dummy')
  #   let(:testing) {category.insert}

  #   it 'add a record to database' do
  #     expect { testing }.to change { Category.get_all_categories.size }.by(1)
  #   end
  # end

  # describe '#delete' do
  #   category = Category.new(nil,'deletion')
  #   category.insert

  #   output = Category.get_all_categories
  #   puts output.last.id
  #   id = output.last.id
  #   category = Category.new(id, nil)
  #   let(:testing) {category.delete}

  #   it 'delete a record from database' do
  #     expect { testing }.to change { Category.get_all_categories.size }.by(-1)
  #   end
  # end
end