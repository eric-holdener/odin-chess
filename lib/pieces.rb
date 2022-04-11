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
    i = 0
    while i < 8
      j = 0
      while j < 8
        test_val = [node[0] + i, node[1] + j]
        if test_val != node
          if i == j
            children.push([node[0] + i, node[1] + j])
            children.push([node[0] + i, node[1] - j])
            children.push([node[0] - i, node[1] + j])
            children.push([node[0] - i, node[1] - j])
          elsif i == 0 || j == 0
            children.push([node[0] + i, node[1] + j])
            children.push([node[0] + i, node[1] - j])
            children.push([node[0] - i, node[1] + j])
            children.push([node[0] - i, node[1] - j])
          end
        end
        j += 1
      end
      i += 1
    end
    children = children.uniq
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
    i = 0
    while i < 8
      j = 0
      while j < 8
        if i == 0 || j == 0
          if i == j
            j += 1
            next
          else
            children.push([node[0] + i, node[1] + j])
            children.push([node[0] + i, node[1] - j])
            children.push([node[0] - i, node[1] + j])
            children.push([node[0] - i, node[1] - j])
            j += 1
          end
        else
          j += 1
        end
      end
      i += 1
    end
    children = children.uniq
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

class Bishop < Pieces
  attr_accessor :symbol
  def initialize(parent)
    super(parent)
    @symbol = 'B'
  end

  def get_valid_moves(node)
    children = []
    i = 0
    while i < 8
      check = [node[0] + i, node[1] + i]
      if check == node
        i += 1
      else
        children.push([node[0] + i, node[1] + i])
        children.push([node[0] + i, node[1] - i])
        children.push([node[0] - i, node[1] + i])
        children.push([node[0] - i, node[1] - i])
        i += 1
      end
    end
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
      children.push([node[0] + 1, node[1] + 0])
      children.push([node[0] + 1, node[1] + 1])
      children.push([node[0] + 1, node[1] - 1])
    else
      children.push([node[0] - 1, node[1] + 0])
      children.push([node[0] - 1, node[1] + 1])
      children.push([node[0] - 1, node[1] - 1])
    end
    
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

  def get_start_row
    if @parent = 'W'
      6
    else
      1
    end
  end
end