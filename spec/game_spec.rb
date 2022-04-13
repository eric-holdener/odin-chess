require './lib/game.rb'

describe Game do
  subject(:game) { described_class.new('human', 'human') }

  describe '#initialize' do
    context 'when game is initialized' do
      it 'creates a chess game board' do
        expect(game.game_board.length).not_to be nil
      end

      it 'creates player 1 as player_1' do
        expect(game.player_1).to be_kind_of(Player)
      end

      it 'creates player 2 as player_2' do
        expect(game.player_2).to be_kind_of(Player)
      end

      it 'sets player_1 (white) to current player' do
        expect(game.current_player).to eq(game.player_1)
      end
    end
  end

  describe '#create_board' do
    context 'creates a default chess board of size 8x8' do
      it 'has an empty chess board of width 8' do
        board = game.create_board
        expect(board.length).to eq(8)
      end

      it 'has an empty chess board of length 8' do
        board = game.create_board
        expect(board[0].length).to eq(8)
      end
    end
  end

  describe '#populate_board' do
    context 'fills the empty game board with pieces' do
      it 'populates the chess board with pieces in default positions - rook' do
        expect(game.game_board[0][0]).to be_kind_of(Rook)
      end
    end
  end

  describe '#parse_valid_moves_again' do
    context 'takes all valid moves from a pieces location, gets possible moves that the piece can make given the board' do
      it 'stops and returns an array of one less when it reaches a piece of the same type' do
      end

      it 'stops and returns an array including the location when it reaches a piece of the same type' do
      end

      it 'gives the full arrays when given a piece that can move unobstructed in each way' do
      end

      it 'returns a subarray for a pawn when it can capture' do
      end

      it 'returns no subarray for a pawn when it cannot capture' do
      end
    end
  end
end