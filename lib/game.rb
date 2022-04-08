require_relative 'pieces'
require_relative 'player'

class Game
  attr_accessor :game_board, :player_1, :player_2, :current_player
  def initialize(player_1, player_2)
    @game_board = create_board
    @player_1 = Player.new(player_1, 'white')
    @player_2 = Player.new(player_2, 'black')
    @current_player = @player_1
  end

  def play_game
    # plays the chess game
  end

  def create_board
    game_board = []
    8.times { game_board.push(Array.new(8)) }
    game_board
  end

  def populate_board
    # write code
  end

  def print_board(board = @game_board)
    board.each_with_index do |row, index|
      puts "#{index} #{row.join(' ')}"
    end
    puts " #{(0..7).to_a.join(' ')}"
  end
end