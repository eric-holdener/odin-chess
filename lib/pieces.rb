class Pieces
  attr_accessor :alive, :valid_moves, :parent
  def initialize(parent)
    @alive = true
    @valid_moves = []
    @parent = parent
  end
end

class King < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'K'
  end
end

class Queen < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'Q'
  end
end

class Knight < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'H'
  end
end

class Rook < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'R'
  end
end

class Bishop < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'B'
  end
end

class Pawn < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'P'
  end
end