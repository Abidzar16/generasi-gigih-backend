require 'mysql2'
require './item'
require './category'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :database => "food_oms_db",
        :port => 3308
    )

    client
end

def get_all_items
    client = create_db_client
    rawData = client.query("SELECT * FROM items")
    items = Array.new
    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
end

def get_all_categories
    client = create_db_client
    rawData = client.query("SELECT * FROM categories")
    categories = Array.new
    rawData.each do |data|
        category = Category.new(data["id"], data["name"])
        categories.push(category)
    end
    categories
end

def get_all_items_with_categories
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

def post_an_items(name,price,category)
    client = create_db_client
    client.query("INSERT INTO `items` (`name`, `price`) VALUES ('#{name}', '#{price}')");
    id_value = client.query("SELECT id FROM items order by id desc limit 1;")
    id_value.each do |value|
        insert_item = client.query("INSERT INTO `item_categories` (`item_id`, `category_id`)
                                    VALUES ('#{value["id"]}', '#{category.to_i}');")
    end                                
end

def delete_an_items(id)
    client = create_db_client
    client.query("DELETE FROM `item_categories` WHERE `item_id` = #{id}");
    client.query("DELETE FROM `items` WHERE `id` = #{id}");
end

def get_spesific_item(id)
    client = create_db_client
    rawData = client.query("SELECT * FROM items WHERE `id` = '#{id}';")
    items = Array.new
    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
end

def edit_an_items(id, name,price,category)
    client = create_db_client
    client.query("UPDATE items
                SET `name` = '#{name}', `price` = '#{price}'
                WHERE `id` = '#{id}';");
    client.query("UPDATE item_categories
                SET `category_id` = '#{category}'
                WHERE `item_id` = '#{id}';");
end