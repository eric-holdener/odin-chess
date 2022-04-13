class Pieces
  attr_accessor :alive, :valid_moves, :parent
  def initialize(parent)
    @alive = true
    @valid_moves = []
    @parent = parent
  end

  def check_moves(children, node)
    children.each do |direction|
      i = 0
      while i < direction.length
        if direction[i][0] > 7 || direction[i][0].negative? || direction[i][1] > 7 || direction[i][1].negative?
          direction.delete_at(i)
        elsif direction[i] == node
          direction.delete_at(i)
        else
          i += 1
        end
      end
    end
    i = 0
    while i < children.length
      if children[i].empty?
        children.delete_at(i)
      else
        i += 1
      end
    end
    children
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
    children
  end
end

class Queen < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'Q'
  end

  def get_valid_moves(node)
    children = []
    up_left = []
    up_right = []
    up = []
    right = []
    down_right = []
    down = []
    down_left = []
    left = []
    i = 0
    while i < 8
      up_left.push([node[0] - i, node[1] - i])
      up.push([node[0] - i, node[1]])
      up_right.push([node[0] - i, node[1] + i])
      right.push([node[0], node[1] + i])
      down_right.push([node[0] + i, node[1] + i])
      down.push([node[0] + i, node[1]])
      down_left.push([node[0] + i, node[1] - i])
      left.push([node[0], node[1] - i])
      i += 1
    end
    children.push(up_left)
    children.push(up)
    children.push(up_right)
    children.push(right)
    children.push(down_right)
    children.push(down)
    children.push(down_left)
    children.push(left)

    children = check_moves(children, node)

    children
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
    children
  end
end

class Rook < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'R'
  end

  def get_valid_moves(node)
    children = []
    up = []
    right = []
    down = []
    left = []
    i = 0
    while i < 8
      up.push([node[0] - i, node[1]])
      right.push([node[0], node[1] + i])
      down.push([node[0] + i, node[1]])
      left.push([node[0], node[1] - i])
      i += 1
    end

    children.push(up)
    children.push(right)
    children.push(down)
    children.push(left)

    children = check_moves(children, node)

    children
  end
end

class Bishop < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'B'
  end

  def get_valid_moves(node)
    children = []
    up_right = []
    up_left = []
    down_right = []
    down_left = []
    i = 0
    while i < 8
      up_left.push([node[0] - i, node[1] - i])
      up_right.push([node[0] - i, node[1] + i])
      down_right.push([node[0] + i, node[1] + i])
      down_left.push([node[0] + i, node[1] - i])
      i += 1
    end

    children.push(up_right)
    children.push(up_left)
    children.push(down_right)
    children.push(down_left)

    children = check_moves(children, node)

    children
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
    normal_move = []
    capture_moves = []

    if @start_row == 1
      normal_move.push([node[0] + 1, node[1] + 0])
      capture_moves.push([node[0] + 1, node[1] + 1])
      capture_moves.push([node[0] + 1, node[1] - 1])
    else
      normal_move.push([node[0] - 1, node[1] + 0])
      capture_moves.push([node[0] - 1, node[1] + 1])
      capture_moves.push([node[0] - 1, node[1] - 1])
    end

    children.push(normal_move)
    children.push(capture_moves)
    
    children = check_moves(children, node)
    
    children
  end

  def get_start_row
    if @parent == 'W'
      6
    else
      1
    end
  end
end