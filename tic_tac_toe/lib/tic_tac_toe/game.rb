class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def start_game
    print_board
    until game_is_over?(board.cells) || tie?(board.cells)
      if tie?(board.cells)
        puts "The game is tied!"
        exit
      end

      if board.user_play_first == 'y'
           get_human_spot

        if !game_is_over?(board.cells) && !tie?(board.cells)
          get_computer_spot
        end
      else
        get_computer_spot

        if !game_is_over?(board.cells) && !tie?(board.cells)
          get_human_spot
        end
      end
    end
    puts "Game over"  
    print_board
  end

  def get_human_spot
    spot = nil 
    until spot #human played
      puts "Enter a valid spot (0-8):"
      user_spot = gets.chomp
      spot = user_spot.to_i
      if !valid_input?(user_spot)
        puts "#{user_spot} is not a valid input"
        spot = nil
        print_board
      elsif board.cells[spot] != "X" && board.cells[spot] != "O"
        board.cells[spot] = board.hum
        puts "Human player chose spot: #{spot}"
      else
        puts "Spot: #{user_spot} is already taken, choose another cell!"
        spot = nil
      end
    end
  end

  def get_computer_spot
    spot = nil
    until spot
      if board.cells[4] == "4"
        spot = 4
        board.cells[spot] = board.com
        puts "Computer player chose spot: #{spot}"
        print_board
      else
        spot = get_best_move(board, board.com)
        if board.cells[spot] != "X" && board.cells[spot] != "O"
          board.cells[spot] = board.com  
          puts "Computer player chose spot: #{spot}"
          print_board
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.cells.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board.cells[as.to_i] = board.com
      if game_is_over?(board.cells)
        best_move = as.to_i
        board.cells[as.to_i] = as
        return best_move
      else
        board.cells[as.to_i] = board.hum
        if game_is_over?(board.cells)
          best_move = as.to_i
          board.cells[as.to_i] = as
          return best_move
        else
          board.cells[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over?(board)

    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def tie?(board)
    board.all? { |s| s == "X" || s == "O" }
  end

  def print_board
    puts " #{board.cells[0]} | #{board.cells[1]} | #{board.cells[2]} \n===+===+===\n #{board.cells[3]} | #{board.cells[4]} | #{board.cells[5]} \n===+===+===\n #{board.cells[6]} | #{board.cells[7]} | #{board.cells[8]} \n"
  end

  def valid_input?(user_spot)
    %w(0 1 2 3 4 5 6 7 8).include?user_spot
  end
end


