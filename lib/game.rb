require_relative 'pieces'
require_relative 'player'

class Game
  attr_accessor :game_board, :player_1, :player_2, :current_player
  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1, 'W')
    @player_2 = Player.new(player_2, 'B')
    @game_board = populate_board(create_board)
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

  def populate_board(board)
    # populate top row with black player pieces
    board[0][0] = player_2.pieces['rook_1']
    board[0][1] = player_2.pieces['knight_1']
    board[0][2] = player_2.pieces['bishop_1']
    board[0][3] = player_2.pieces['king']
    board[0][4] = player_2.pieces['queen']
    board[0][5] = player_2.pieces['bishop_2']
    board[0][6] = player_2.pieces['knight_2']
    board[0][7] = player_2.pieces['rook_2']
    # pawns for black
    board[1][0] = player_2.pieces['pawn_1']
    board[1][1] = player_2.pieces['pawn_2']
    board[1][2] = player_2.pieces['pawn_3']
    board[1][3] = player_2.pieces['pawn_4']
    board[1][4] = player_2.pieces['pawn_5']
    board[1][5] = player_2.pieces['pawn_6']
    board[1][6] = player_2.pieces['pawn_7']
    board[1][7] = player_2.pieces['pawn_8']

    # pawns for white
    board[6][0] = player_1.pieces['pawn_1']
    board[6][1] = player_1.pieces['pawn_2']
    board[6][2] = player_1.pieces['pawn_3']
    board[6][3] = player_1.pieces['pawn_4']
    board[6][4] = player_1.pieces['pawn_5']
    board[6][5] = player_1.pieces['pawn_6']
    board[6][6] = player_1.pieces['pawn_7']
    board[6][7] = player_1.pieces['pawn_8']

    # populate bottom row with white player pieces
    board[7][0] = player_1.pieces['rook_1']
    board[7][1] = player_1.pieces['knight_1']
    board[7][2] = player_1.pieces['bishop_1']
    board[7][3] = player_1.pieces['king']
    board[7][4] = player_1.pieces['queen']
    board[7][5] = player_1.pieces['bishop_2']
    board[7][6] = player_1.pieces['knight_2']
    board[7][7] = player_1.pieces['rook_2']

    # return board
    board
  end

  def print_board(board = @game_board)
    board.each_with_index do |row, index|
      values = []
      board[index].each_with_index do |column, idx2|
        if board[index][idx2].nil?
          values.push(nil)
        else
          values.push(column.parent + column.symbol)
        end
      end
      puts "#{index} #{values.join(' ')}"
    end
    puts "  #{(0..7).to_a.join('  ')}"
  end
end