def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors 8
p factors 3
p factors 1
p factors 0
p factors(-1)
p factors(-2)
