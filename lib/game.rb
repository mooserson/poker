require_relative 'deck'
require_relative 'game'
require_relative 'hand'
require_relative 'player'

class Game
  attr_reader :players,
  attr_accessor :pot, :round_players, :last_raiser

  def initialize(players)
    @players = players
    @round_players = players
    @last_raiser = nil
    @pot = 0
    @current_player = @round_players[0]
  end

  def run
    until players_dry?
      play
    end
  end

  def play
    betting_round
    if @round_players.length > 1
      swapping_round
      betting_round
    end

    showndown
    reset_round_players
  end

  def betting_round
    @round_players.each do |player|
      break if player == @last_raiser
      handle_response(player, player.take_bet)
      next_player!
    end
  end

  def handle_response(player, bet_move)
    case bet_move
    when :fold
      fold(player)
    when :call
      call(player)
    end
    raise_bet(player, bet_move)
  end

  # def next_player!
  #   if @current_player == @round_players[-1]
  #     @current_player = @round_players.first
  #   else
  #   @round_players.each_with_index do |player, idx|
  #     @current_player = player if @round_players[idx-1] == @current_player
  #   end
  # end

  def swapping_round

  end

  def showdown
    #who wind update winners money
  end

  end

  end

  private

  def fold(player)
    @round_players.delete(@current_player)
  end

  def call(player)
    bet = @last_raiser.bet - @current_player.bet
    @pot += bet
    player.bet += bet
    player.cash -= bet
  end

  def raise_bet(player, bet_move)
    @pot += bet_move
    player.bet += bet_move
    player.cash -= bet_move
    @last_raiser = player
  end
  
  private

  def players_dry?
    @players.count{ |player| player.pot == 0} == 3
  end
end
