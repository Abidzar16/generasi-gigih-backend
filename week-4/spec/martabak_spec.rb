require './src/martabak'

describe Martabak do
    it "is delicious" do
        martabak = Martabak.new("cokelat")
        taste = martabak.taste

        expect(taste) == "martabak cokelat is delicious"
    end
end