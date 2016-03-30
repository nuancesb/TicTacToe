require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  describe "#print_board" do
    it 'creates the board' do
      expect(@board[0]). to eq'0'
    end
  end
  #test every winning situations
  describe "winning situations" do
    it "game is over" do
      expect(@game.game_is_over?([
        "X", "X", "X",
        "O", "4", "O",
        "6", "7", "8"
      ])).to be true

      expect(@game.game_is_over?([
        "0", "1", "2",
        "X", "X", "X",
        "6", "7", "8"
      ])).to be true
    end
  end
  #test every tie situations
  describe "#tie" do
    it "is tie if the players can not play anymore" do
      board = [
        "O", "X", "X",
        "O", "X", "O",
        "X", "O", "X"
      ]
      expect(@game.tie(board)).to be true
    end
  end
end