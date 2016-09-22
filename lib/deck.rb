require_relative 'card'

class Deck
  SUITS = [:hearts, :spades, :diamonds, :clubs]

  def self.build_deck
    deck = []

    SUITS.each do |suit|
      (2..14).each{ |value| deck << Card.new(value, suit)}
    end

    deck.shuffle!
  end
end
