CHOICES = %w(rock paper scissors spock lizard)
ALIASES = {
  'r' => CHOICES[0],
  'p' => CHOICES[1],
  's' => CHOICES[2],
  'k' => CHOICES[3],
  'l' => CHOICES[4]
}

def prompt(message)
  puts ">> #{message}"
end

def ask_user_choice
  loop do
    prompt("Choose: #{CHOICES.join(', ')} (#{ALIASES.keys.join(', ')})")
    choice = gets.chomp.downcase
    choice = ALIASES[choice] || choice
    return choice if CHOICES.include?(choice)
    prompt('Invalid input.')
  end
end

def pick_computer_choice
  CHOICES.sample
end

# 0: tie, 1: one, 2: two
def winner_of(player_one, player_two)
  one_index = CHOICES.index(player_one)
  two_index = CHOICES.index(player_two)
  cycle_distance = (one_index - two_index) % CHOICES.length
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
    winner_code = winner_of(user_move, computer_move)

    display_results(user_move, computer_move, winner_code)

    prompt('Would you like to play again? (y)')
    break unless gets.chomp.downcase == 'y'
  end
end

# TESTS

def run_tests
  tie_game =
    winner_of('rock', 'rock') == 0 &&
    winner_of('paper', 'paper') == 0 &&
    winner_of('scissors', 'scissors') == 0 &&
    winner_of('spock', 'spock') == 0 &&
    winner_of('lizard', 'lizard') == 0
  player_one_win =
    winner_of('rock', 'lizard') == 1 &&
    winner_of('paper', 'rock') == 1 &&
    winner_of('scissors', 'paper') == 1 &&
    winner_of('spock', 'scissors') == 1 &&
    winner_of('lizard', 'spock') == 1 &&
    winner_of('rock', 'lizard') == 1 &&
    winner_of('paper', 'rock') == 1 &&
    winner_of('scissors', 'paper') == 1 &&
    winner_of('spock', 'scissors') == 1 &&
    winner_of('lizard', 'spock') == 1
  player_two_win =
    winner_of('rock', 'spock') == 2 &&
    winner_of('paper', 'lizard') == 2 &&
    winner_of('scissors', 'rock') == 2 &&
    winner_of('spock', 'paper') == 2 &&
    winner_of('lizard', 'scissors') == 2 &&
    winner_of('rock', 'spock') == 2 &&
    winner_of('paper', 'lizard') == 2 &&
    winner_of('scissors', 'rock') == 2 &&
    winner_of('spock', 'paper') == 2 &&
    winner_of('lizard', 'scissors') == 2
  all_pass = tie_game && player_one_win && player_two_win
  puts all_pass ? "Tests passed." : "SOME TESTS FAILED."
end

run_tests()

# MAIN

main()
