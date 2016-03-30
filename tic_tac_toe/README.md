# TicTacToe in ruby

## How to run it:

  from the command line :

    git clone git@github.com:nuancesb/coding_challenges.git
    cd coding challenges
    cd ruby
    bundle install
    cd tic_tac_toe
    cd lib
    cd tic_tac_toe
    ruby game_start.rb


## The features:

  * human player vs computer player
  * the game allows the user to choose their marker "X" or "O",
  * the game allows the user to choose which player goes first,
  * the game can handle a bad user input - the human player has to choose between 0 and 8 to mark a cell. If he chooses something else, he will be asked to re-enter a valid input,
  * the game notifies the user when a cell is selected on the board.


## How I worked on it:

  Attempt 1: Refactoring the existing code

  It is tricky, especially when you didn't write the code in the first instance.
  The first thing I did was understanding the logic of the game. Then, I implemented the features as requested in the pdf. Then, I tried to test the different methods but realized they were too long and almost impossible to test.
  If I had wanted to write tests, I would have had to write a new game from scratch.

  Attempt 2: Building a new tic tac toe

  I made several attempts to write a new game using the "write test first" rule.
  I got stuck quickly and decided it would have actually been wiser to stick with the first game, as it already had a logic which was working.

  Attempt 3: Coming back to the first game - more refactoring

  I refactored some methods and also created a board class and a game class. I finally managed to add more tests.