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

  def get_valid_moves(node)
    children = []
    children.push([node[0] + 1, node[1] + 1])
    children.push([node[0] + 1, node[1] + 0])
    children.push([node[0] + 1, node[1] - 1])
    children.push([node[0] + 0, node[1] + 1])
    children.push([node[0] + 0, node[1] - 1])
    children.push([node[0] - 1, node[1] + 1])
    children.push([node[0] - 1, node[1] + 0])
    children.push([node[0] - 1, node[1] - 1])
    i = 0
    while i < children.length
      if children[i][0] > 7 || children[i][0].negative? || children[i][1] > 7 || children[i][1].negative?
        children.delete_at(i)
      else
        i += 1
      end
    end
    self.valid_moves = children
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

  def get_valid_moves(node)
    children = []
    children.push([node[0] + 2, node[1] + 1])
    children.push([node[0] + 2, node[1] - 1])
    children.push([node[0] - 2, node[1] + 1])
    children.push([node[0] - 2, node[1] - 1])
    children.push([node[0] + 1, node[1] + 2])
    children.push([node[0] + 1, node[1] - 2])
    children.push([node[0] - 1, node[1] + 2])
    children.push([node[0] - 1, node[1] - 2])
    i = 0
    while i < children.length
      if children[i][0] > 7 || children[i][0].negative? || children[i][1] > 7 || children[i][1].negative?
        children.delete_at(i)
      else
        i += 1
      end
    end
    self.valid_moves = children
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
    @start_row = get_start_row
  end

  def get_valid_moves(node)
    children = []
    if @start_row == 1
      children.push(node[0] + 1, node[1] + 0)
      children.push(node[0] + 1, node[1] + 1)
      children.push(node[0] + 1, node[1] - 1)
    else
      children.push(node[0] - 1, node[1] + 0)
      children.push(node[0] - 1, node[1] + 1)
      children.push(node[0] - 1, node[1] - 1)
    end
    
    i = 0
    while i < children.length
      if children[i][0] > 7 || children[i][0].negative? || children[i][1] > 7 || children[i][1].negative?
        children.delete_at(i)
      else
        i += 1
      end
    end
    self.valid_moves = children
  end

  def get_start_row
    if @parent = 'W'
      return 6
    else
      return 1
  end
end