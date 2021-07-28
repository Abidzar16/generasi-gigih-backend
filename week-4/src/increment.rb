class Increment
    attr_accessor :array
    def initialize(array)
        @array = array
    end

    def addone
        i = @array.length - 1
        @array[i] += 1

        while @array[i] >= 9 && i >= 0
            @array[i] = 0
            if i.zero?
                @array.unshift(1)
            else
                @array[i-1] += 1
            end
            i -= 1
        end
        @array
    end
end