require 'pieces.rb'
require 'player.rb'

class Game
  def initialize(player_1, player_2)
    @game_board = create_board
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
    @current_player = @player_1
  end

  def play_game
    # plays the chess game
  end

  def create_board
    # write code
  end

  def populate_board
    # write code
  end
end