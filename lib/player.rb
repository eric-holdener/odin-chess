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
end