# the user makes a choice
# the computer makes a choice
# the winner is displayed

def prompt(message)
  puts ">> #{message}"
end

def user_choice
  prompt('Choose rock, paper, or scissors:')
  loop do
    choice = gets.chomp.downcase
    return choice if %w(rock paper scissors).include?(choice)
    prompt('Invalid input. (rock/paper/scissors)')
  end
end

def computer_choice
  %w(rock paper scissors).sample
end

def winner(a, b)
  a_index = %w(rock paper scissors).index(a)
  b_index = %w(rock paper scissors).index(b)
  (a_index - b_index) % 3 # 0: tie, 1: a, 2: b
end

def play_game
  loop do
    user_move = user_choice
    computer_move = computer_choice
    winner_code = winner(user_move, computer_move)
    win_text = [
      "It's a tie!",
      'You win!',
      'You lose...'
    ][winner_code]
    prompt("You play #{user_move} against the computer's #{computer_move}.")
    prompt(win_text)
    prompt('Would you like to play again? (y)')
    play_again = gets.chomp.downcase == 'y'
    break unless play_again
  end
end

# TESTS

run_tests = true
if run_tests
  all_pass = \
    winner('rock', 'rock') == 0 \
    && winner('paper', 'paper') == 0 \
    && winner('scissors', 'scissors') == 0 \
    && winner('rock', 'scissors') == 1 \
    && winner('paper', 'scissors') == 2 \
    && winner('scissors', 'paper') == 1 \
    && winner('scissors', 'rock') == 2
  puts all_pass ? "Tests passed." : "SOME TESTS FAILED."
end

# MAIN

play_game()
