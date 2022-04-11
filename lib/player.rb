require_relative 'pieces'
require_relative 'game'

class Player
  attr_accessor :player_type, :player_color, :pieces
  def initialize(type, color)
    @player_type = type
    @player_color = color
    @pieces = {'king' => King.new(color), 'queen' => Queen.new(color), 'bishop_1' => Bishop.new(color),
              'bishop_2' => Bishop.new(color), 'knight_1' => Knight.new(color), 'knight_2' => Knight.new(color),
              'rook_1' => Rook.new(color), 'rook_2' => Rook.new(color), 'pawn_1' => Pawn.new(color),
              'pawn_2' => Pawn.new(color), 'pawn_3' => Pawn.new(color), 'pawn_4' => Pawn.new(color), 
              'pawn_5' => Pawn.new(color), 'pawn_6' => Pawn.new(color), 'pawn_7' => Pawn.new(color),
              'pawn_8' => Pawn.new(color)}
  end

  def select_piece(board)
    loop do
      user_input = gets.chomp
      verified_input = verify_input(user_input.split('')) if user_input.match?(/^\w\d+$/)
      converted_input = convert_input(input) if verified_input
      tf = check_for_valid_piece(converted_input, board) if verified_input
      return converted_input if tf

      puts "Input error! Please enter a proper location (Letter - Number)."
    end
  end

  def get_move
    # gets user input to move a piece to a valid location
  end

  def unselect_piece
    # prompts user to if they want to unselect the piece they selected
  end

  def verify_input(input)
    valid_letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
    return input if valid_letters.include?(input[0].downcase) && input[1].to_i.between?(0, 7)
  end

  def check_for_valid_piece(input, board)
    if board[input[0]][input[1]].nil?
      false
    elsif board[input[0]][input[1]].parent != @player_color
      false
    else
      true
    end
  end

  def convert_input(input)
    letter_input = input[0].downcase
    number_input = input[1].to_i
    case letter_input
    when 'a'
      input = [0, number_input]
    when 'b'
      input = [1, number_input]
    when 'c'
      input = [2, number_input]
    when 'd'
      input = [3, number_input]
    when 'e'
      input = [4, number_input]
    when 'f'
      input = [5, number_input]
    when 'g'
      input = [6, number_input]
    when 'h'
      input = [7, number_input]
    end

    input
  end
end
