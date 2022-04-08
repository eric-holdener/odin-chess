require_relative 'pieces'
require_relative 'game'

class Player
  attr_accessor :player_type, :player_color, :king, :queen, :bishop_1, :bishop_2, :knight_1,
  :knight_2, :rook_1, :rook_2, :pawn_1, :pawn_2, :pawn_3, :pawn_4, :pawn_5, :pawn_6, :pawn_7, :pawn_8
  def initialize(type, color)
    @player_type = type
    @player_color = color
    @king = King.new
    @queen = Queen.new
    @bishop_1 = Bishop.new
    @bishop_2 = Bishop.new
    @knight_1 = Knight.new
    @knight_2 = Knight.new
    @rook_1 = Rook.new
    @rook_2 = Rook.new
    @pawn_1 = Pawn.new
    @pawn_2 = Pawn.new
    @pawn_3 = Pawn.new
    @pawn_4 = Pawn.new
    @pawn_5 = Pawn.new
    @pawn_6 = Pawn.new
    @pawn_7 = Pawn.new
    @pawn_8 = Pawn.new
  end
end