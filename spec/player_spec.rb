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
end