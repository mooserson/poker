require 'byebug'

class Hand

  attr_accessor :hand, :card_values
  def initialize
    @hand = []
    # @card_values = card_values
  end

  def royal_flush
    # byebug
    if same_suit? && (10..14) == (card_values[0]..card_values[-1])
       100
    end
  end

  def straight_flush
    if same_suit? && (card_values[0]..card_values[-1]).to_a == card_values
       90
    end
  end

  def pair_scores
    highest_count = matcher.values.max
    case highest_count
    when 4
      80
    when 3
      40
    when 2
      20
    end
  end

  def full_house
    matcher.values.select{ |val| 3 || 2}.length == 2 ? 70 : nil
  end

  def flush
    same_suit? ? 60 : nil
  end

  def straight
    (card_values[0]..card_values[-1]).to_a == card_values ? 50 : nil
  end

  def two_pair
    matcher.values.select{ |val| val == 2 }.length == 2 ? 30 : nil
  end

  def high_card
    card_values.max
  end

  def card_values
    @hand.map { |card| card.value }.sort
  end
  private

  def matcher
    matches = {}

    card_values.each do |card|
      matches[card] = card_values.count(card)
    end

    matches
  end


  def same_suit?
    @hand.all? { |card| card.suit == @hand[0].suit }
  end
end
