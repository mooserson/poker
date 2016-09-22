require_relative 'hand'

class Player
  attr_accessor :hand, :cash, :name, :current_bet

  def initialize(name, cash)
    @name = name
    @cash = cash
    @hand = Hand.new
    @current_bet = nil
  end

  def take_bet
    puts "Fold, call or raise amount"
    move = parse_move(gets.chomp)
    move
  end

  def take_swap
    puts "How many cards to swap?"
    swap = gets.chomp.to_i
    swap
  end

  def parse_move(move)
    if (move =~ /[0-9]/) == 0
      move.to_i
    else
      move.to_sym
    end
  end

end
