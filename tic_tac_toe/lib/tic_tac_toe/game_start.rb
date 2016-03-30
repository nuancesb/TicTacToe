require './game'
require '../tic_tac_toe/board'

board = Board.new # create an instance/object of Board class
board.choose_marker
board.choose_turn

game = Game.new(board)
game.start_game
