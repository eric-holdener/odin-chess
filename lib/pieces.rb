class Pieces
  attr_accessor :alive, :valid_moves
  def initialize
    @alive = true
    @valid_moves = []
  end
end

class King < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'K'
  end
end

class Queen < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'Q'
  end
end

class Knight < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'H'
  end
end

class Rook < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'R'
  end
end

class Bishop < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'B'
  end
end

class Pawn < Pieces
  attr_accessor :symbol
  def initialize
    super
    @symbol = 'P'
  end
end