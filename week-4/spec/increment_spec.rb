require './src/increment'

describe Increment do
    it "test [9, 9, 9]" do
        increment = Increment.new([9, 9, 9])
        addone = increment.addone

        expect(addone).to eq([1, 0, 0, 0])
    end

    it "test [9]" do
        increment = Increment.new([9])
        addone = increment.addone

        expect(addone).to eq([1, 0])
    end

    it "test [0]" do
        increment = Increment.new([0])
        addone = increment.addone

        expect(addone).to eq([1])
    end
end