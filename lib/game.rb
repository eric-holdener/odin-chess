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
    if player_1.pieces['king'].alive == false || player_2.pieces['king'].alive
      # code for end of game
    elsif check_for_check
      # code for king in check
    else
      board = @game_board
      print_board(board)
      loop do
        piece = @current_player.select_piece
        all_possible_moves = piece.get_valid_moves
        if piece.class == Pawn
          valid_moves = parse_valid_moves_pawn(all_possible_moves, board, @current_player)
        else
          valid_moves = parse_valid_moves_again(all_possible_moves, board, @current_player)
        end
        return if valid_moves.empty? == false

        puts 'That piece cannot move. Please choose another piece'
      end
      print_moves(valid_moves)
      if @current_player.unselect_piece
        play_game
      else
        loop do
          move = @current_player.get_move
          if valid_moves.include? move
            board = move_pieces(board, move, piece)
            if @current_player == @player_1
              @current_player = @player_2
            else
              @current_player = @player_1
            end
            @game_board = board
            return
          end
          puts 'Please enter a valid move from the list.'
        end
      end
    end
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
    set_locations
    board
  end

  def set_locations
    player_2.pieces['rook_1'].location = [0, 0]
    player_2.pieces['knight_1'].location = [0, 1]
    player_2.pieces['bishop_1'].location = [0, 2]
    player_2.pieces['king'].location = [0, 3]
    player_2.pieces['queen'].location = [0, 4]
    player_2.pieces['bishop_2'].location = [0, 5]
    player_2.pieces['knight_2'].location = [0, 6]
    player_2.pieces['rook_2'].location = [0, 7]
    # pawns for black
    player_2.pieces['pawn_1'].location = [1, 0]
    player_2.pieces['pawn_2'].location = [1, 1]
    player_2.pieces['pawn_3'].location = [1, 2]
    player_2.pieces['pawn_4'].location = [1, 3]
    player_2.pieces['pawn_5'].location = [1, 4]
    player_2.pieces['pawn_6'].location = [1, 5]
    player_2.pieces['pawn_7'].location = [1, 6]
    player_2.pieces['pawn_8'].location = [1, 7]

    # pawns for white
    player_1.pieces['pawn_1'].location = [6, 0]
    player_1.pieces['pawn_2'].location = [6, 1]
    player_1.pieces['pawn_3'].location = [6, 2]
    player_1.pieces['pawn_4'].location = [6, 3]
    player_1.pieces['pawn_5'].location = [6, 4]
    player_1.pieces['pawn_6'].location = [6, 5]
    player_1.pieces['pawn_7'].location = [6, 6]
    player_1.pieces['pawn_8'].location = [6, 7]

    # populate bottom row with white player pieces
    player_1.pieces['rook_1'].location = [7, 0]
    player_1.pieces['knight_1'].location = [7, 1]
    player_1.pieces['bishop_1'].location = [7, 2]
    player_1.pieces['king'].location = [7, 3]
    player_1.pieces['queen'].location = [7, 4]
    player_1.pieces['bishop_2'].location = [7, 5]
    player_1.pieces['knight_2'].location = [7, 6]
    player_1.pieces['rook_2'].location = [7, 7]
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
      case index
      when 0
        puts "A #{values.join(' ')}"
      when 1
        puts "B #{values.join(' ')}"
      when 2
        puts "C #{values.join(' ')}"
      when 3
        puts "D #{values.join(' ')}"
      when 4
        puts "E #{values.join(' ')}"
      when 5
        puts "F #{values.join(' ')}"
      when 6
        puts "G #{values.join(' ')}"
      when 7
        puts "H #{values.join(' ')}"
      end
    end
    puts "  #{(0..7).to_a.join('  ')}"
  end

  def print_moves(moves)
    moves.each_with_index do |direction, idx|
      direction.each do |move|
        case move[0]
        when 0
          puts "A#{move[1]}"
        when 1
          puts "B#{move[1]}"
        when 2
          puts "C#{move[1]}"
        when 3
          puts "D#{move[1]}"
        when 4
          puts "E#{move[1]}"
        when 5
          puts "F#{move[1]}"
        when 6
          puts "G#{move[1]}"
        when 7
          puts "H#{move[1]}"
        end
      end
    end
  end

  def parse_valid_moves_again(moves, board, player)
    moves.each_with_index do |direction, idx|
      i = 0
      while i < direction.length
        if board[direction[i][0]][direction[i][1]].nil?
          i += 1
        elsif board[direction[i][0]][direction[i][1]].parent == player.player_color
          if i  >  0
            direction = direction.slice(0..i - 1)
          else
            direction = []
          end
          moves[idx] = direction
          break
        elsif
          board[direction[i][0]][direction[i][1]].parent != player.player_color
          if i  >  0
            direction = direction.slice(0..i)
          else
            direction = [direction[0]]
          end
          moves[idx] = direction
          break
        end
      end
    end
    moves = clean_arrays(moves)
    moves
  end

  def parse_valid_moves_pawn(moves, board, player)
    moves.each_with_index do |direction, idx|
      if idx == 0
        if board[direction[0][0]][direction[0][1]].nil?
          next
        else
          direction.delete_at(0)
        end
      else
        i = 0
        while i < direction.length
          if board[direction[i][0]][direction[i][1]] != nil && 
          board[direction[i][0]][direction[i][1]].parent != player.player_color
            i += 1
            next
          else
            direction.delete_at(i)
          end
        end
      end
    end
    moves = clean_arrays(moves)
    moves
  end

  def clean_arrays(array)
    i = 0
    while i < array.length
      if array[i].empty?
        array.delete_at(i)
      else
        i += 1
      end
    end
    array
  end

  def move_pieces(board, move, new_piece)
    if board[move[0]][move[1]] != nil
      piece = board[move[0]][move[1]]
      unalive_pieces(piece)
    end
    board[new_piece.location[0]][new_piece.location[1]] = nil
    board[move[0]][move[1]] = new_piece
    new_piece.location = move
    board
  end

  def unalive_pieces(piece)
    piece.alive = false
  end
end
