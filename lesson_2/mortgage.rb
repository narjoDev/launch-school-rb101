require 'yaml'

MESSAGES = YAML.load_file('mortgage.yml')
LANGUAGE = 'en'

def message(key, lang = 'en')
  MESSAGES[lang][key]
end

def prompt(message = '')
  puts ">> #{message}"
end

def number?(number, nonnegative: true, nonzero: true)
  return false if nonnegative && number.to_f.negative?
  return false if nonzero && number.to_f == 0
  number.to_f.to_s == number || number.to_i.to_s == number
end

def get_amount
  prompt(message('request_amount'))
  loop do
    amount = gets.chomp
    return amount.to_f if number?(amount)
    prompt(message('invalid_amount'))
  end
end

# Yearly rate
def get_rate
  loop do
    prompt(message('request_rate'))
    rate = gets.chomp
    return rate.to_f if number?(rate, nonzero: true)
    prompt(message('input_invalid'))
  end
end

# Duration in years
def get_duration
  loop do
    prompt(message('request_duration'))
    duration = gets.chomp
    return duration.to_f if number?(duration)
    prompt(message('input_invalid'))
  end
end

# monthly interest, duration in months => monthly payment
def calculate_payment(principal, interest, duration)
  principal * (interest / (1 - ((1 + interest)**(0 - duration))))
end

def calculator_loop
  amount = get_amount
  annual_rate = get_rate / 100
  monthly_rate = annual_rate / 12
  years = get_duration
  months = years * 12
  monthly_payment = calculate_payment(amount, monthly_rate, months)
  response = message('monthly_payment') + "#{format('%.2f', monthly_payment)}"
  prompt(response)
end

calculator_loop
