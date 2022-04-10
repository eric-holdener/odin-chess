require './lib/pieces.rb'

describe Pieces do
  subject(:pieces) { described_class.new }

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
  subject(:king) { described_class.new }

  describe '#initalize' do
    context 'the subclass inherits from the master class' do
      it 'the piece is alive' do
        expect(king.alive).to be true
      end

      it 'valid moves is an empty array' do
        expect(king.valid_moves).to eq([])
      end
    end
  end
end