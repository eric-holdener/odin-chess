require './lib/player.rb'
require './lib/game.rb'

describe Player do
  subject(:player) { described_class.new('human', 'W') }
  subject(:game) { Game.new('human', 'human') }

  describe '#initialize' do
    context 'when game is initialized' do
      it 'assigns player type - human or computer' do
        expect(player.player_type).to eq('human')
      end

      it 'assigns player a color - white in this example' do
        expect(player.player_color).to eq('W')
      end

      it 'creates a hash with all pieces in it' do
        expect(player.pieces['king']).to be_kind_of(King)
      end
    end
  end

  describe '#select_piece' do
    context 'player should be prompted to select a piece to make a move with' do
      before do
        user_input = 'H0'
        allow(player).to receive(:gets).and_return(user_input)
      end

      it 'returns an array selection of [x][y] for selecting piece on board' do
        expect(player.select_piece(game.game_board)).to eq('H0')
      end
    end

    context 'when a player enters a value outside the scope of the board' do
      before do
        invalid_input = 'J8'
        user_input = 'H0'
        allow(player).to receive(:gets).and_return(invalid_input, user_input)
      end

      it 'returns an error and prompts the user again' do
        error_message = 'Input error! Please enter a proper location (Letter - Number).'
        expect(player).to receive(:puts).with(error_message)
        player.select_piece(game.game_board)
      end
    end

    context 'when a player enters a value on the board that is not their piece' do
      before do
        invalid_input = 'A0'
        valid_input = 'H0'
        allow(player).to receive(:gets).and_return(invalid_input, user_input)
      end

      it 'returns an error on the invalid piece and prompts the user again' do

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

  describe '#check_for_valid_piece' do
    context 'checks to make sure the board location selected' do
      it 'is the same color as player' do
        input = [7, 7]
        board = game.game_board
        expect(player.check_for_valid_piece(input, board)).to be true
      end

      it 'returns false if it is nil' do
        input = [5, 5]
        board = game.game_board
        expect(player.check_for_valid_piece(input, board)).to be false
      end

      it 'returns false if piece is the opposite color' do
        input = [0, 0]
        board = game.game_board
        expect(player.check_for_valid_piece(input, board)).to be false
      end
    end
  end

  describe '#convert_input' do
    context 'takes an already verified input and converts it to computer usable' do
      it 'converts [A, 7] to [0, 7]' do
        input = ['A', '7']
        expect(player.convert_input(input)).to eq([0, 7])
      end
    end
  end
end
