require 'rspec'

describe Player do
  subject(:player) { Player.new(1000, "John")}
  describe "#initialize" do

    it "initializes with money, hand and name" do
      expect(player.money).to eq(1000)
      expect(player.name).to eq("John")
      expect(player.hand).to eq([])
      expect(player.bet).to eq(0)
    end

  end
end
