original = 'The Munsters are creepy in a good way.'

target_one = 'tHE mUNSTERS ARE CREEPY IN A GOOD WAY.'
target_two = 'The munsters are creepy in a good way.'
target_three = 'the munsters are creepy in a good way.'
target_four = 'THE MUNSTERS ARE CREEPY IN A GOOD WAY.'

p one = original.swapcase!
p(one == target_one)

p two = original.capitalize!
p(two == target_two)

p three = original.downcase!
p(three == target_three)

p four = original.upcase!
p(four == target_four)
