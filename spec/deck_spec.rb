require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck }

  describe "##build_deck" do

    it "build a deck with 52 unique card objects" do
      expect(Deck.build_deck.uniq.length).to eq(52)
    end

  end
end
