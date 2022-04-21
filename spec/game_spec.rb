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
        expected = [[[3, 6], [2, 6], [1, 6], [0, 6]], [[4, 7]], [[5, 6], [6, 6], [7, 6]]]
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
        board = game.create_board
        pawn = game.player_1.pieces['pawn_1']
        board[4][4] = pawn
        valid_moves = pawn.get_valid_moves([4, 4])
        parse_valid_moves_pawn = game.parse_valid_moves_pawn(valid_moves, board, game.player_1)
        expected = [[[3, 4]]]
        expect(parse_valid_moves_pawn).to eq(expected)
      end

      it 'returns nothing if space in front is occupied' do
        board = game.create_board
        pawn = game.player_1.pieces['pawn_1']
        pawn_2 = game.player_1.pieces['pawn_2']
        board[4][4] = pawn
        board[3][4] = pawn_2
        valid_moves = pawn.get_valid_moves([4, 4])
        parse_valid_moves_pawn = game.parse_valid_moves_pawn(valid_moves, board, game.player_1)
        expected = []
        expect(parse_valid_moves_pawn).to eq(expected)
      end

      it 'returns left if space diagonal left is occupied by an enemy' do
        board = game.create_board
        pawn = game.player_1.pieces['pawn_1']
        pawn_2 = game.player_2.pieces['pawn_1']
        board[4][4] = pawn
        board[3][3] = pawn_2
        valid_moves = pawn.get_valid_moves([4, 4])
        parse_valid_moves_pawn = game.parse_valid_moves_pawn(valid_moves, board, game.player_1)
        expected = [[[3,4]], [[3,3]]]
        expect(parse_valid_moves_pawn).to eq(expected)
      end

      it 'returns right if space diagonal right is occupied by an enemy' do
        board = game.create_board
        pawn = game.player_1.pieces['pawn_1']
        pawn_2 = game.player_2.pieces['pawn_1']
        board[4][4] = pawn
        board[3][5] = pawn_2
        valid_moves = pawn.get_valid_moves([4, 4])
        parse_valid_moves_pawn = game.parse_valid_moves_pawn(valid_moves, board, game.player_1)
        expected = [[[3,4]], [[3,5]]]
        expect(parse_valid_moves_pawn).to eq(expected)
      end
    end
  end

  describe "move_pieces" do
    context 'after a move is made by a player, moves pieces is called' do
      it 'sets a nil board location to the new piece, returns the board' do
        board = game.create_board
        move = [4, 4]
        piece = game.player_1.pieces['rook_1']
        piece.location = [3, 4]
        board[3][4] = piece
        board = game.move_pieces(board, move, piece)
        expect(board[4][4]).to eq(piece)
      end

      it 'sets a piece already in that location to alive = false, moves the new piece to that location, returns the board' do
        board = game.create_board
        move = [4, 4]
        piece = game.player_1.pieces['rook_1']
        piece.location = [3, 4]
        dead_piece = game.player_2.pieces['rook_1']
        dead_piece.location = [4, 4]
        board[3][4] = piece
        board[4][4] = dead_piece
        board = game.move_pieces(board, move, piece)
        expect(dead_piece.alive).to be false
      end

      it 'changes location of piece moved to the new move location' do
        board = game.create_board
        move = [4, 4]
        piece = game.player_1.pieces['rook_1']
        piece.location = [3, 4]
        board[3][4] = piece
        board = game.move_pieces(board, move, piece)
        expect(piece.location).to eq(move)
      end

      it 'sets old location of piece on board to nil' do
        board = game.create_board
        move = [4, 4]
        piece = game.player_1.pieces['rook_1']
        piece.location = [3, 4]
        board[3][4] = piece
        board = game.move_pieces(board, move, piece)
        expect(board[3][4]).to be nil
      end
    end
  end

  describe "check_for_check" do
    context 'returns true when king is in check, false when it is not' do
      it 'returns true when diagonal is in check' do
        board = game.create_board
        king = game.player_1.pieces['king']
        bishop = game.player_2.pieces['bishop_1']
        board[4][4] = king
        board[6][6] = bishop
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be true
      end

      it 'returns true when up/down/left/right is in check' do
        board = game.create_board
        king = game.player_1.pieces['king']
        rook = game.player_2.pieces['rook_1']
        board[4][4] = king
        board[4][6] = rook
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be true
      end

      it 'returns true when pawn is checking king' do
        board = game.create_board
        king = game.player_1.pieces['king']
        pawn = game.player_2.pieces['pawn_1']
        board[4][4] = king
        board[5][3] = pawn
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be true
      end

      it 'returns true when knight is checking king' do
        board = game.create_board
        king = game.player_1.pieces['king']
        knight = game.player_2.pieces['knight_1']
        board[4][4] = king
        board[6][5] = knight
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be true
      end

      it 'returns false when there is a piece blocking a diagonal checker' do
        board = game.create_board
        king = game.player_1.pieces['king']
        pawn = game.player_1.pieces['pawn_1']
        bishop = game.player_2.pieces['bishop_1']
        board[4][4] = king
        board[5][5] = pawn
        board[6][6] = bishop
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be false
      end

      it 'returns false when there is a piece blocking a hor_ver checker' do
        board = game.create_board
        king = game.player_1.pieces['king']
        pawn = game.player_1.pieces['pawn_1']
        rook = game.player_2.pieces['rook_1']
        board[4][4] = king
        board[4][5] = pawn
        board[4][6] = rook
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be false
      end

      it 'returns false when king is not in check' do
        board = game.create_board
        king = game.player_1.pieces['king']
        pawn = game.player_2.pieces['pawn_1']
        rook = game.player_2.pieces['rook_1']
        bishop = game.player_2.pieces['bishop_1']
        board[4][4] = king
        board[2][3] = pawn
        board[5][6] = rook
        board[6][4] = bishop
        game.current_player = game.player_1
        game.player_1.pieces['king'].location = [4, 4]
        game.game_board = board
        check_vals = game.check_for_check(board)
        expect(check_vals['tf']).to be false
      end
    end
  end
end
