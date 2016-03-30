class Board
  
  attr_accessor :cells, :com, :hum, :user_play_first

  def initialize
    @cells = (0..8).to_a
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
    @user_play_first = 'y'
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