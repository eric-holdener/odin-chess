require './lib/pieces.rb'

describe Pieces do
  subject(:pieces) { described_class.new('W') }

  describe '#initialize' do
    context 'initializes that master pieces class with the correct variables' do
      it 'the piece is alive' do
        expect(pieces.alive).to be true
      end

      it 'valid moves is an empty array' do
        expect(pieces.valid_moves).to eq([])
      end
    end
  end
end

describe King do
  subject(:king) { described_class.new('W') }

  describe '#initalize' do
    context 'the subclass inherits from the master class' do
      it 'the piece is alive' do
        expect(king.alive).to be true
      end

      it 'valid moves is an empty array' do
        expect(king.valid_moves).to eq([])
      end
    end
    
    context 'the subclass has its symbol set' do
      it 'the king has symbol k' do
        expect(king.symbol).to eq('K')
      end
    end
  end

  describe '#valid_moves(location)' do
    context 'returns a list of all valid moves a king can move from any location' do
      it 'returns valid moves for king from location[0][0[' do
        expected = [[1,1],[1,0],[0,1]]
        node = [0, 0]
        valid = king.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end

describe Queen do
  subject(:queen) { described_class.new('W') }
  describe '#get_valid_moves' do
    context 'returns valid moves' do
      it 'returns an array of all valid moves for queen' do
        expected = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                  [1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],
                  [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]]
        node = [0,0]
        valid = queen.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end

describe Knight do
  subject(:knight) { described_class.new('W') }
  describe '#get_valid_moves' do
    context 'returns valid moves' do
      it 'returns an array of all valid moves for knight' do
        expected = [[2,1][1,2]]
        node = [0,0]
        valid = knight.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end

describe Rook do
  subject(:rook) { described_class.new('W') }
  describe '#get_valid_moves' do
    context 'returns valid moves' do
      it 'returns an array of all valid moves for rook' do
        expected = [[0,1][0,2][0,3][0,4][0,5][0,6][0,7][1,0][2,0][3,0][4,0][5,0][6,0][7,0]]
        node = [0,0]
        valid = rook.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end

describe Bishop do
  subject(:bishop) { described_class.new('W') }
  describe '#get_valid_moves' do
    context 'returns valid moves' do
      it 'returns an array of all valid moves for bishop' do
        expected = [[1,1][2,2][3,3][4,4][5,5][6,6][7,7]]
        node = [0,0]
        valid = bishop.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end

describe Pawn do
  subject(:pawn) { described_class.new('B') }
  describe '#get_valid_moves' do
    context 'returns valid moves' do
      it 'returns an array of all valid moves for pawn' do
        expected = [[1,0][1,1]]
        node = [0,0]
        valid = pawn.get_valid_moves(node)
        expect(valid).to eq(expected)
      end
    end
  end
end