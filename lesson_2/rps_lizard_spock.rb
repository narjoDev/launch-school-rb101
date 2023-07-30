# the user makes a choice
# the computer makes a choice
# the winner is displayed

CHOICES = %w(rock paper scissors spock lizard)

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

# 0: tie, 1: one, 2: two
def determine_winner(player_one, player_two)
  one_index = CHOICES.index(player_one)
  two_index = CHOICES.index(player_two)
  cycle_distance = (one_index - two_index) % 5
  if cycle_distance == 0
    0
  elsif cycle_distance.odd?
    1
  else
    2
  end
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

def run_tests
  tie_game =
    determine_winner('rock', 'rock') == 0 &&
    determine_winner('paper', 'paper') == 0 &&
    determine_winner('scissors', 'scissors') == 0 &&
    determine_winner('spock', 'spock') == 0 &&
    determine_winner('lizard', 'lizard') == 0
  player_one_win =
    determine_winner('rock', 'lizard') == 1 &&
    determine_winner('paper', 'rock') == 1 &&
    determine_winner('scissors', 'paper') == 1 &&
    determine_winner('spock', 'scissors') == 1 &&
    determine_winner('lizard', 'spock') == 1 &&
    determine_winner('rock', 'lizard') == 1 &&
    determine_winner('paper', 'rock') == 1 &&
    determine_winner('scissors', 'paper') == 1 &&
    determine_winner('spock', 'scissors') == 1 &&
    determine_winner('lizard', 'spock') == 1
  player_two_win =
    determine_winner('rock', 'spock') == 2 &&
    determine_winner('paper', 'lizard') == 2 &&
    determine_winner('scissors', 'rock') == 2 &&
    determine_winner('spock', 'paper') == 2 &&
    determine_winner('lizard', 'scissors') == 2 &&
    determine_winner('rock', 'spock') == 2 &&
    determine_winner('paper', 'lizard') == 2 &&
    determine_winner('scissors', 'rock') == 2 &&
    determine_winner('spock', 'paper') == 2 &&
    determine_winner('lizard', 'scissors') == 2
  all_pass = tie_game && player_one_win && player_two_win
  puts all_pass ? "Tests passed." : "SOME TESTS FAILED."
end

run_tests()

# MAIN

main()
