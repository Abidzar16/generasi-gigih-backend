require './db/db_connector'

class Category
    attr_reader :id, :name

    def initialize(id=nil, name=nil)
        @id = id
        @name = name
    end

    def self.get_all_categories
        rawData = create_db_client.query("SELECT * FROM categories;")
        categories = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def self.get_by_id(id)
        rawData = create_db_client.query("SELECT * FROM categories WHERE id = #{id};")
        categories = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories[0]
    end

    def insert
        return false unless valid?
        create_db_client.query("INSERT INTO `categories` (`name`) VALUES ('#{@name}');");
    end

    def edit
        return false unless valid?
        create_db_client.query("UPDATE `categories` 
                                SET `name` = '#{@name}' 
                                WHERE `id` = '#{@id}';");
    end

    def self.delete(id)
        return false unless valid?
        client.query("DELETE FROM `item_categories` WHERE `category_id` = #{@id}");
        create_db_client.query("UPDATE `categories` 
                                SET `name` = '#{@name}' 
                                WHERE `id` = '#{@id}';");
    end

    def valid?
        if @name.nil? == false && check_unique? == true
            true
        end
        false
    end

    def check_unique?
        results = create_db_client.query("SELECT * FROM categories WHERE name = #{@name} LIMIT 1;");
        results.each do |result|
            if result["name"] == @name 
                false
            end
        end
        true
    end

    
end