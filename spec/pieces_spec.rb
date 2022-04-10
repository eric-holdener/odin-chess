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