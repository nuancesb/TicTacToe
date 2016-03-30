require_relative '../lib/tic_tac_toe/game.rb'
require_relative '../lib/tic_tac_toe/board.rb'

describe Game do
  let(:board) { Board.new }
  let(:game) { Game.new(board) }


  describe '#initialize' do
    it 'knows board is an instance of board class'do
     expect(game.board).to be_a Board
    end

    it 'knows the board has 8 cells' do
      expect(game.board.cells).to eq (0..8).to_a
    end

    it 'knows the human can play with the O symbol' do
      expect(game.board.hum).to eq ("O")
    end

    it 'knows the computer can play with the X symbol' do
      expect(game.board.com).to eq ("X")
    end
    
    it 'knows if human chooses to play first, he has to say yes (y)' do
      expect(game.board.user_play_first).to eq ("y")
    end 
  end

  describe '#print_board' do
    it 'draw a board with 8 cells organised in 3 colums and 3 rows'do
    allow($stdout).to receive(:puts)

      expect(board.cells).to match_array([0,1,2,3,4,5,6,7,8])
    end
  end

  describe '#game_is_over?' do
    context 'valid game over condition' do
      let(:board) { %w(X X X O X X O X O) }

      it 'is a valid game over' do
        expect(game).to receive(:game_is_over?).with(board).and_return true
        game.game_is_over?(board)
      end
    end

    context 'more valid game over condition' do
      let(:board) { %w(X 1 O X O X O O O) }

      it 'is a valid game over' do
        expect(game).to receive(:game_is_over?).with(board).and_return true
        game.game_is_over?(board)
      end
    end

    context 'not a game over condition' do
      let(:board) {  %w(X X O O X X O X O) }

      it 'is not a valid game over' do
        expect(game).to receive(:game_is_over?).with(board).and_return false
        game.game_is_over?(board)
      end
    end 
  end

  describe '#tie?' do
    context 'is a tie' do
      let(:board) { %w(X X O O X X O X O) }

      it 'is a valid tie' do
        expect(game).to receive(:tie?).with(board).and_return true
        game.tie?(board)
      end
    end

    context 'is not a tie' do
      let(:board) {  %w(X O 2 O X 5 O X O) }

      it 'is not a valid tie' do
        expect(game).to receive(:tie?).with(board).and_return false
        game.tie?(board)
      end
    end
  end

  describe '#valid_input?' do
    context 'valid input' do
      let(:user_spot) { 8 }

      it 'is a valid input' do
        expect(game).to receive(:valid_input?).with(user_spot).and_return true
        game.valid_input?(user_spot)
      end
    end

    context 'invalid input' do
      let(:user_spot) { 'z'}

      it 'is not a valid input' do
        expect(game).to receive(:valid_input?).with(user_spot).and_return false
        game.valid_input?(user_spot)
      end
    end
  end
end








