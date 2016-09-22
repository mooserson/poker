require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) {Hand.new}
  let(:card14h) {double('card14h', :value => 14, :suit => :hearts)}
  let(:card12h) {double('card12h', :value => 12, :suit => :hearts)}
  let(:card13h) {double('card13h', :value => 13, :suit => :hearts)}
  let(:card11h) {double('card11h', :value => 11, :suit => :hearts)}
  let(:card10h) {double('card10h', :value => 10, :suit => :hearts)}
  let(:card10s) {double('card10s', :value => 10, :suit => :spades)}
  let(:card9h) {double('card9h', :value => 9, :suit => :hearts)}


  describe "#royal_flush" do
    it "identifies a royal flush" do
      hand.hand = [card14h, card12h, card13h, card11h, card10h]
      expect(hand.royal_flush).to eq(100)

    end
  end

  describe "#straight_flush" do
    it "identifies a straight flush" do
      hand.hand = [card13h, card12h, card10h, card11h, card9h]
      expect(hand.straight_flush).to eq(90)
    end
  end

  describe "#matcher" do

    context "four-of-a-kind" do
      it "identifies a four of a kind" do
      hand.hand = [card12h, card12h, card12h, card12h, card10h]
        expect(hand.pair_scores).to eq(80)
      end
    end

    context "three-of-a-kind" do
      it "identifies three of a kind" do
      hand.hand = [card12h, card12h, card12h, card11h, card10h]
        expect(hand.pair_scores).to eq(40)
      end
    end

    context "two-of-a-kind" do
      it "identifies two of a kind" do
      hand.hand = [card12h, card12h, card13h, card11h, card10h]
        expect(hand.pair_scores).to eq(20)
      end
    end
  end

  describe "#full_house" do

    it "identifies a full house" do
    hand.hand = [card12h, card12h, card12h, card11h, card11h]
      expect(hand.full_house).to eq(70)
    end
  end


  describe "#flush" do
    it "identifies a flush" do
        hand.hand = [card14h, card13h, card12h, card11h, card9h]
        expect(hand.flush).to eq(60)
    end
  end

  describe "#straight" do
    it "identifies a straight" do
      hand.hand = [card14h, card13h, card12h, card11h, card10s]
      expect(hand.straight).to eq(50)
    end
  end

  describe "#two_pair" do
    it "identifies a two_pair" do
      hand.hand = [card13h, card13h, card12h, card12h, card10s]
      expect(hand.two_pair).to eq(30)
    end
  end

  describe "#high_card" do
    it "identifies a high card and returns its value" do
      hand.hand = [card13h, card11h, card10h, card12h, card10s]
      expect(hand.high_card).to eq(13)
    end
  end
end
