# the user makes a choice
# the computer makes a choice
# the winner is displayed

CHOICES = %w(rock paper scissors)

def prompt(message)
  puts ">> #{message}"
end

def ask_user_choice
  loop do
    prompt("Choose: #{CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    return choice if CHOICES.include?(choice)
    prompt('Invalid input.')
  end
end

def pick_computer_choice
  CHOICES.sample
end

def determine_winner(player_one, player_two)
  one_index = CHOICES.index(player_one)
  two_index = CHOICES.index(player_two)
  (one_index - two_index) % 3 # 0: tie, 1: one, 2: two
end

def display_results(user_move, computer_move, winner_code)
  result = [
    "It's a tie.",
    'You win!',
    'You lose...'
  ][winner_code]

  prompt("You play #{user_move}. The computer plays #{computer_move}.")
  prompt(result)
end

def main
  loop do
    user_move = ask_user_choice
    computer_move = pick_computer_choice
    winner_code = determine_winner(user_move, computer_move)

    display_results(user_move, computer_move, winner_code)

    prompt('Would you like to play again? (y)')
    break unless gets.chomp.downcase == 'y'
  end
end

# TESTS

run_tests = true
if run_tests
  all_pass = \
    determine_winner('rock', 'rock') == 0 \
    && determine_winner('paper', 'paper') == 0 \
    && determine_winner('scissors', 'scissors') == 0 \
    && determine_winner('rock', 'scissors') == 1 \
    && determine_winner('paper', 'scissors') == 2 \
    && determine_winner('scissors', 'paper') == 1 \
    && determine_winner('scissors', 'rock') == 2
  puts all_pass ? "Tests passed." : "SOME TESTS FAILED."
end

# MAIN

main()
