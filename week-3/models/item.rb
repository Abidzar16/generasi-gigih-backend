require './db/db_connector'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.id
        @id
    end

    def self.name
        @name
    end

    def self.price
        @price
    end

    def self.category
        @category
    end

    def self.get_spesific_items(id)
        client = create_db_client
        rawData = client.query("SELECT items.id, items.name, items.price, 
            categories.id AS category_id, categories.name AS category
            FROM items
            JOIN item_categories ON items.id = item_categories.item_id
            JOIN categories ON item_categories.category_id = categories.id
            WHERE categories.id = '#{id[:id]}'")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"], data["category"])
            items.push(item)
        end
        items
    end

    def self.get_items_by_id(id)
        client = create_db_client
        rawData = client.query("SELECT * FROM items WHERE id = #{id}")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end
        items.first
    end

    def self.get_items_and_categories
        client = create_db_client
        rawData = client.query("SELECT items.id, items.name, items.price, 
            categories.id AS category_id, categories.name AS category
            FROM items
            JOIN item_categories ON items.id = item_categories.item_id
            JOIN categories ON item_categories.category_id = categories.id")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"], data["category"])
            items.push(item)
        end
        items
    end

    def edit
        client = create_db_client
        client.query("UPDATE items
                    SET `name` = '#{@name}', `price` = '#{@price}'
                    WHERE `id` = '#{@id}';");
        client.query("UPDATE item_categories
                    SET `category_id` = '#{@category}'
                    WHERE `item_id` = '#{@id}';");
    end

    def insert
        client = create_db_client
        client.query("INSERT INTO items
                    (`name`,`price`) values ('#{@name}','#{@price}');");
        id = client.query("SELECT id FROM items ORDER BY id DESC limit 1");
        
        client.query("INSERT item_categories (`category_id`, `item_id`) 
                    VALUES ('#{@category}','#{id.first['id']}');");
    end

    def delete
        client = create_db_client
        client.query("DELETE FROM `item_categories` WHERE `item_id` = #{@id}");
        client.query("DELETE FROM `items` WHERE `id` = #{@id}");
    end

    def valid?
        if @name.nil? == false && check_unique? == true
            true
        end
        false
    end

    def check_unique?
        results = create_db_client.query("SELECT * FROM items WHERE name = #{@name} LIMIT 1;");
        results.each do |result|
            if result["name"] == @name 
                false
            end
        end
        true
    end
end