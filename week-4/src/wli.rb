class Wli
    attr_reader :names

    def initialize(names)
        @names=names
    end

    def likes
        if  @names.length() == 1 then
            "#{names[0]} like this"
        elsif  @names.length() == 2 then
            "#{names[0]} and #{names[1]} like this"
        elsif @names.length() == 3
            string = ""
            @names.each_with_index do |item, index|
                if index+1 == @names.length()
                    string += "and #{item} like this"
                elsif index+1 == @names.length() - 1
                    string += "#{item} "
                else
                    string += "#{item}, "
                end
            end
            string
        elsif @names.length() == 0
            "no one like this"
        else
            "#{names[0]}, #{names[1]} and #{@names.length() - 2} others like this"
        end
    end
end