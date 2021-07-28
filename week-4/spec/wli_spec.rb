require './src/wli'

describe Wli do
    it "likes function 2 people" do
        wli = Wli.new(['A','B'])
        likes = wli.likes

        expect(likes).to eq("A and B like this")
    end

    it "likes function 3 people" do
        wli = Wli.new(['A','B','C'])
        likes = wli.likes

        expect(likes).to eq("A, B and C like this")
    end

    it "likes function 1 people" do
        wli = Wli.new(['A'])
        likes = wli.likes

        expect(likes).to eq("A like this")
    end

    it "likes function 0 people" do
        wli = Wli.new([])
        likes = wli.likes

        expect(likes).to eq("no one like this")
    end

    it "likes function more than 3 people" do
        wli = Wli.new(['A','B','C','D'])
        likes = wli.likes

        expect(likes).to eq("A, B and 2 others like this")
    end
end