require_relative '../db/db_connector.rb'

class Order
    attr_accessor :reference_no, :customer_name, :date

    def initialize(reference_no, customer_name, date)
        @reference_no = reference_no
        @customer_name = customer_name
        @date = date
    end

    def self.get_all_orders
        client = create_db_client
        raw_data = client.query("select * from orders")
        orders = Array.new
        raw_data.each do |order|
            orders.push(Order.new(
                order["reference_no"],order["customer_name"],order["date"]
            ))
        end
        orders
    end

    def save
        return false unless valid?
    end
end