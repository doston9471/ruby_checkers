require_relative '../game.rb'
require 'pry'

describe 'Player' do
  let(:player) { Checkers::Player.new('P1', 'andy') }

  before do
    player
  end

  it 'can initialize a player with player no' do
    expect(player.player_no).to eq 'P1'
  end

  it 'can initialize a player with a name' do
    expect(player.player_name).to eq 'andy'
  end

  it 'initializes a player with all game pieces as pawns' do
    first_piece = player.player_pieces.first
    expect(first_piece.type).to eq 'pawn'
    last_piece = player.player_pieces.last
    expect(last_piece.type).to eq 'pawn'
  end

  it 'initializes a player with 20 game pieces' do
    expect(player.player_pieces.length).to eq 20
  end
end

describe 'GamePiece' do
  let(:player) { Checkers::Player.new('P1', 'Jimmy') }
  let(:pawn_piece) do
    Checkers::GamePiece.new(
      player.player_no,
      'pawn'
    )
  end

  let(:pawn_abilities) do
    {
      diaganol_left_forward: true,
      diaganol_left_backward: false,
      diaganol_right_forward: true,
      diaganol_right_backward: false
    }
  end

  let(:king_abilities) do
    {
      diaganol_left_forward: true,
      diaganol_left_backward: true,
      diaganol_right_forward: true,
      diaganol_right_backward: true
    }
  end

  it 'creates a piece with a player no' do
    pawn_piece
    expect(pawn_piece.player_no).to eq player.player_no
  end

  it 'creates a pawn piece with appropriate abilities' do
    pawn_piece
    expect(pawn_piece.moves.abilities[:diaganol_left_forward]).to eq true
    expect(pawn_piece.moves.abilities[:diaganol_right_forward]).to eq true
    expect(pawn_piece.moves.abilities[:diaganol_left_backward]).to eq false
    expect(pawn_piece.moves.abilities[:diaganol_right_backward]).to eq false
  end
end

describe 'Board' do
  let(:player_one) { Checkers::Player.new('P1', 'andy') }
  let(:player_two) { Checkers::Player.new('P2', 'sid') }
  let(:game_board) do
    Checkers::Board.new(
      player_one.player_pieces,
      player_two.player_pieces
    )
  end

  before do
    player_one
    player_two
    game_board
  end

  it 'creates an 10x10 square board' do
    # Height
    expect(game_board.board_squares.length).to eq 10
    # Width
    expect(game_board.board_squares[1].length).to eq 10
  end

  it 'places each players board pieces on the board' do
    first_row_square = game_board.board_squares[1][:a]
    expect(first_row_square.class).to eq Checkers::GamePiece
    last_row_square = game_board.board_squares[10][:a]
    expect(last_row_square.class).to eq Checkers::GamePiece
  end
end

describe 'Game' do
  let(:game) do
    Checkers::Game.new(
      'Newman',
      'Jerry'
    )
  end

  context 'class methods' do
    it 'displays the game board' do
      game
      expect(game.display_game_board).to eq game.board
    end

    it 'parses the user input' do
    end

    context 'pawn piece moves' do
      it 'can move a pawn diaganol left forward' do
      end

      it 'can move a pawn diaganol right forward' do
      end

      it 'cannot move a pawn diaganol right backward' do
      end

      it 'cannot move a pawn diaganol left backward' do
      end
    end
  end
end
