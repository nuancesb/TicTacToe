class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
    @user_play_first = 'y'
  end

  def start_game
    print_board
    until game_is_over?(@board) || tie(@board)
      if tie(@board)
        puts "The game is tied!"
        exit
      end

      if @user_play_first == 'y'
           get_human_spot

        if !game_is_over?(@board) && !tie(@board)
          get_computer_spot
        end
      else
        get_computer_spot

        if !game_is_over?(@board) && !tie(@board)
          get_human_spot
        end
      end
    end
    puts "Game over"  
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
      elsif @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = @hum
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
      if @board[4] == "4"
        spot = 4
        @board[spot] = @com
        puts "Computer player chose spot: #{spot}"
        print_board
      else
        spot = get_best_move(@board, @com)
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @com  
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
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @com
      if game_is_over?(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if game_is_over?(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
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

  def tie(board)
    board.all? { |s| s == "X" || s == "O" }
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def valid_input?(user_spot)
    ['0','1','2','3','4','5','6','7','8'].include?user_spot
  end

  def choose_marker
  puts "Welcome to Tic Tac Toe Game! Which marker do you want to play with ? Choose X or O "
  @hum = gets.chomp.upcase
  @com = case @hum
         when "X" then "O"
         when "O" then "X"
         end 
  puts "Human is #{@hum} and computer is #{@com}"
  end

  def choose_turn
    puts "Do you want to play first ? (y/n)"
    @user_play_first = gets.chomp.downcase
  end
end


