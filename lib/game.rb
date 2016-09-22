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
      handle_response(player.take_bet)
    end
  end

  def handle_response(bet_move)
    case bet_move
    when :fold
      fold
    when :call
      call
    end
    raise_bet(bet_move)
  end

  def next_player!
    if @current_player == @round_players[-1]
      @current_player = @round_players.first
    else
    @round_players.each_with_index do |player, idx|
      @current_player = player if @round_players[idx-1] == @current_player
    end
  end

  def swapping_round

  end

  def showdown
    #who wind update winners money
  end

  end

  end

  private

  def fold
    @round_players.delete(@current_player)
  end

  def call
    bet = @last_raiser.bet - @current_player.bet
    @pot += bet
    @current_player.bet += bet
    @current_player.cash -= bet
  end

  def raise_bet(bet_move)
    @last_raiser = @current_player
  end

  def players_dry?
    @players.count{ |player| player.pot == 0} == 3
  end
end
