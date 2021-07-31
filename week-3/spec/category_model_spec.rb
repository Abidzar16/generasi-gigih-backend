require './models/category.rb'
require './db/db_connector'
require_relative "spec_helper"

describe Category do
  describe '#get_all_categories' do
    let(:testing) {Category.get_all_categories}

    it 'return all category' do
      expect(testing.size).to be > 0
    end

  end

  describe '#get_by_id' do
    input = Category.new(1,'beverage')
    let(:testing) {Category.get_by_id(1)}

    it 'return category by id accurately' do
      expect(testing.id).to eq(input.id)
      expect(testing.name).to eq(input.name)
    end
  end

  describe '#insert' do
    category = Category.new(nil,'dummy')
    let(:testing) {category.insert}

    it 'add a record to database' do
      expect { testing }.to change { Category.get_all_categories.size }.by(1)
    end
  end

  describe '#delete' do
    category = Category.new(nil,'deletion')
    category.insert

    output = Category.get_all_categories
    puts output.last.id
    id = output.last.id
    category = Category.new(id, nil)
    let(:testing) {category.delete}

    it 'delete a record from database' do
      expect { testing }.to change { Category.get_all_categories.size }.by(-1)
    end
  end
end