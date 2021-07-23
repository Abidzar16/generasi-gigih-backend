require_relative '../db/db_connector.rb'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end
        items
    end
end