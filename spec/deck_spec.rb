require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "calls #build_deck"
      expect(deck).to receive(:build_deck)
    end
  end

  describe "#build_deck" do

    it "build a deck with 52 unique card objects" do
      expect(deck.build_deck).uniq.length.to eq(52)
    end

    it "calls #shuffle! on the deck" do
      expect(deck.build_deck).to receive(:shuffle!)
    end
  end
end
