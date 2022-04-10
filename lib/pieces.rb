class Pieces
  attr_accessor :alive, :valid_moves
  def initialize
    @alive = true
    @valid_moves = []
  end
end

class King < Pieces
end

class Queen < Pieces
end

class Knight < Pieces
end

class Rook < Pieces
end

class Bishop < Pieces
end

class Pawn < Pieces
end