require 'rspec'

describe Hand do
  subject(:hand) {Hand.new}
  let(:card14h) {double(14, :hearts)}
  let(:card12h) {double(12, :hearts)}
  let(:card13h) {double(13, :hearts)}
  let(:card11h) {double(11, :hearts)}
  let(:card10h) {double(10, :hearts)}
  let(:card10s) {double(10, :spades)}
  let(:card9h) {double(9, :hearts)}


  describe "#royal_flush" do
    it "identifies a royal flush" do
      cards = [:card14h, :card12h, :card13h, :card11h, :card10h]
      expect(hand.royal_flush(cards)).to eq(100)
    end
  end

  describe "#straight_flush" do
    it "identifies a straight flush" do
      cards = [:card13h, :card12h, :card10h, :card11h, :card9h]
      expect(hand.straight_flush(cards)).to eq(90)
    end
  end

  describe "#matcher" do

    context "four-of-a-kind" do
      it "identifies a four of a kind" do
        cards = [:card12h, :card12h, :card12h, :card12h, :card10h]
        expect(hand.matcher(cards)).to eq(40)
      end
    end

    context "three-of-a-kind" do
      it "identifies three of a kind" do
        cards = [:card12h, :card12h, :card12h, :card12h, :card10h]
        expect(hand.matcher(cards)).to eq(20)
      end
    end

    context "two-of-a-kind" do
      it "identifies two of a kind" do
        cards = [:card12h, :card12h, :card13h, :card11h, :card10h]
        expect(hand.matcher(cards)).to eq(0)
      end
    end
  end

  describe "#full_house" do

    it "identifies a full house" do
      cards = [:card12h, :card12h, :card12h, :card11h, :card11h]
      expect(cards.full_house(cards)).to eq(70)
    end
  end


  describe "#flush" do
    it "identifies a flush" do
        cards = [:card14h, :card13h, :card12h, :card11h, :card9h]
        expect(hand.flush(card)).to eq(60)
    end
  end

  describe "#straight" do
    it "identifies a straight" do
      cards = [:card14h, :card13h, :card12h, :card11h, :card10s]
      expect(hand.straight(cards)).to eq(50)
    end
  end

  describe "#two_pair" do
    it "identifies a two_pair" do
      cards = [:card13h, :card13h, :card12h, :card12h, :card10s]
      expect(hand.two_pair(cards)).to eq(30)
    end
  end

  describe "#high_card" do
    it "identifies a high card and returns its value" do
      cards = [:card13h, :card11h, :card10h, :card12h, :card10s]
      expect(hand.high_card(cards)).to eq(13)
    end
  end
end
