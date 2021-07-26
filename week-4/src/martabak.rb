class Martabak
    attr_reader :topping

    def initialize(topping)
        @topping=topping
    end

    def taste
        puts "martabak #{@topping} is delicious"
    end
end

martabak = Martabak.new("cokelat")
martabak.taste