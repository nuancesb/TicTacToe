require_relative '../lib/tic_tac_toe/board.rb'

describe Board do
  let(:board) {Board.new}

  describe '#initialize' do
    it'displays an empty board' do
      expect(board.cells). to eq (0..8).to_a
    end

    it 'chooses a human player' do
      expect(board.hum).to eq 'O'
    end

    it 'chooses a computer player' do
      expect(board.com).to eq 'X'
    end
  end

  describe '#choose_marker' do
    before do
      allow(board).to receive(:hum) { 'O' }
    end

    it 'allows the human to choose a marker' do
      expect(board.com).to eq 'X'
      board.choose_marker
    end
  end

  describe '#choose_turn' do
    context 'user chooses to play first' do
      before do
        allow(board).to receive(:user_play_first) { 'y' }
      end

      it 'allows the human to choose to play first' do
        expect(board.user_play_first).to eq 'y'
        board.choose_turn
      end
    end

    context 'user says no to play first' do
      before do
        allow(board).to receive(:user_play_first) { 'n' }
      end

      it 'allows the human to choose not to play first' do
        expect(board.user_play_first).to eq 'n'
        board.choose_turn
      end
    end
  end
end
