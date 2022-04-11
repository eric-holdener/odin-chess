require './lib/player.rb'

describe Player do
  subject(:player) { described_class.new('human', 'white') }

  describe '#initialize' do
    context 'when game is initialized' do
      it 'assigns player type - human or computer' do
        expect(player.player_type).to eq('human')
      end

      it 'assigns player a color - white in this example' do
        expect(player.player_color).to eq('white')
      end

      it 'creates a hash with all pieces in it' do
        expect(player.pieces['king']).to be_kind_of(King)
      end
    end
  end

  describe '#select_piece' do
    context 'player should be prompted to select a piece to make a move with' do
      it 'returns an array selection of [x][y] for selecting piece on board' do
      end

      it 'returns an error if selection is not a piece that belongs to the player' do
      end

      it 'returns an error if selection is outside scope of the board' do
      end

      it 'returns an error if blank board square is selected' do
      end
    end
  end

  describe '#get_move' do
    context 'gets where player wants to move piece' do
      it 'moves piece to selected location' do
      end

      it 'returns an error if location already has a non capturable unit on it' do
      end

      it 'reutrns an error if input is outside scope of moves piece can make' do
      end

      it 'only allows for legal moves - cannot move THROUGH pieces' do
      end
    end
  end

  describe '#unselect_piece' do
    context 'allows player to unselect a piece' do
      it 'unselects piece given proper input' do
      end

      it 'locks in selection given proper input' do
      end

      it 'reprompts user to give proper input if improper input is given' do
      end
    end
  end
end
