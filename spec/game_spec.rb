require 'rspec'

describe Game do

let(:player1) {double('player1',:money => 1000, :name => "Victor", :hand => [])}
let(:player1) {double('player2',:money => 1000, :name => "Beyonce", :hand => [])}
players = [:player1, :player2]
subject(:game) {Game.new(players)}

  describe "#initialize" do
    it "intializes with array of players, empty pot, current player and players in round" do
      expect(game.players).to eq(players)
    end
  end

  describe "deal" do
    let(:deck) {double('deck', :cards => [2,3,4,5,6,7,8,9,10,11])}
    it "calls build deck on Deck" do
      expect(deck).to receive(:build_deck)
      game.deal
    end

    it "deal cards to players" do
      game.deal
      expect(player1.hand).to eq([2,4,6,8,10])
      expect(player2.hand).to eq([3,5,7,9,11])
    end

    it "pops cards from deck" do
      game.deal
      expect(game.deck.cards).to eq([])
    end
  end

  describe "#betting_round" do
    it "calls take_bet on each player" do
      expect(player1).to receive(:take_bet)
      expect(player2).to receive(:take_bet)
      game.betting_round
    end

    it "updates the pot if the player calls or raises" do
      allow(player1).to receive(:take_bet).and_return(5)
      allow(player2).to receive(:take_bet).and_return(10)
      game.betting_round
      expect(game.min_bet).to eq(10)
      expect(game.pot).to eq(15)

    end
  end

end
