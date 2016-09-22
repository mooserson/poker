require 'rspec'
require 'player'

describe Player do
  subject(:player) { Player.new("John", 1000)}
  describe "#initialize" do

    it "initializes with money, hand and name, empty bet" do
      expect(player.cash).to eq(1000)
      expect(player.name).to eq("John")
      expect(player.hand.class).to eq(Hand)
      expect(player.current_bet).to eq(nil)
    end

  end
end
