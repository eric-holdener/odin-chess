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
        board = game.create_board
        king = game.player_1.pieces['king']
        rook = game.player_1.pieces['rook_1']
        board[4][4] = king
        board[4][6] = rook
        valid_moves = rook.get_valid_moves([4, 6])
        parsed_valid_moves = game.parse_valid_moves_again(valid_moves, board, game.player_1)
        expected = [[[3, 6], [2, 6], [1, 6], [0, 6]], [[4, 7]], [[5, 6], [6, 6], [7, 6]], [[4, 5]]]
        expect(parsed_valid_moves).to eq(expected)
      end

      it 'stops and returns an array including the location when it reaches a piece of a different type' do
        board = game.create_board
        king = game.player_2.pieces['king']
        rook = game.player_1.pieces['rook_1']
        board[4][4] = king
        board[4][6] = rook
        valid_moves = rook.get_valid_moves([4, 6])
        parsed_valid_moves = game.parse_valid_moves_again(valid_moves, board, game.player_1)
        expected = [[[3, 6], [2, 6], [1, 6], [0, 6]], [[4, 7]], [[5, 6], [6, 6], [7, 6]], [[4, 5], [4, 4]]]
        expect(parsed_valid_moves).to eq(expected)
      end

      it 'gives the full arrays when given a piece that can move unobstructed in each way' do
        board = game.create_board
        rook = game.player_1.pieces['rook_1']
        board[4][6] = rook
        valid_moves = rook.get_valid_moves([4, 6])
        parsed_valid_moves = game.parse_valid_moves_again(valid_moves, board, game.player_1)
        expect(parsed_valid_moves).to eq(valid_moves)
      end

      it 'sets array to 0 if there is a teammate piece right next to it in the way' do
        board = game.create_board
        king = game.player_1.pieces['king']
        rook = game.player_1.pieces['rook_1']
        board[4][5] = king
        board[4][6] = rook
        valid_moves = rook.get_valid_moves([4, 6])
        parsed_valid_moves = game.parse_valid_moves_again(valid_moves, board, game.player_1)
        expected = [[[3, 6], [2, 6], [1, 6], [0, 6]], [[4, 7]], [[5, 6], [6, 6], [7, 6]], []]
        expect(parsed_valid_moves).to eq(expected)
      end

      it 'sets array to 1 if there is an enemy piece right next to it in the way' do
        board = game.create_board
        king = game.player_2.pieces['king']
        rook = game.player_1.pieces['rook_1']
        board[4][5] = king
        board[4][6] = rook
        valid_moves = rook.get_valid_moves([4, 6])
        parsed_valid_moves = game.parse_valid_moves_again(valid_moves, board, game.player_1)
        expected = [[[3, 6], [2, 6], [1, 6], [0, 6]], [[4, 7]], [[5, 6], [6, 6], [7, 6]], [[4, 5]]]
        expect(parsed_valid_moves).to eq(expected)
      end
    end
  end

  describe "#parse valid moves pawn" do
    context 'takes all valid moves that a pawn can make and figures out if there are captures or not' do
      it 'returns forward one space if space in front is empty' do
      end

      it 'returns nothing if space in front is occupied' do
      end

      it 'returns left or right if spaces diagonal left or right are occupied by an enemy' do
      end

      it 'returns nothing diagonal if space diagonal are not occupied by an enemy' do
      end
    end
  end
end
