require "pry"

MESSAGE_DATA = {
  english: {
    number_request: "Please enter a number:",
    input_invalid: "Invalid input, please try again.",
    operation_request: "Please specify an operation (add, subtract, multiply, divide, quit)",
    welcome: "Welcome to the calculator.",
    goodbye: "Goodbye",
    divide_by_zero: "You can't divide by zero! Try something else..."
  }
}
LANGUAGE = :english
TEXT = MESSAGE_DATA[LANGUAGE]

def prompt(message)
  puts ">> #{message}"
end

def valid_integer?(number_as_string)
  number_as_string.to_i.to_s == number_as_string
end

def valid_float?(number_as_string)
  number_as_string.to_f.to_s == number_as_string
end

def get_number
  loop do
    prompt(TEXT[:number_request])
    number = gets.chomp
    if valid_integer?(number)
      return number.to_i
    elsif valid_float?(number)
      return number.to_f
    else
      prompt(TEXT[:input_invalid])
    end
  end
end

def get_operation
  loop do
    prompt(TEXT[:operation_request])
    operation = gets.chomp.downcase
    if %w(add subtract multiply divide quit).include?(operation)
      return operation
    else
      prompt(TEXT[:input_invalid])
    end
  end
end

def perform_operation(operation, a, b)
  solution = nil
  operator_symbol = nil

  case operation
  when "add"
    solution = a + b
    operator_symbol = "+"
  when "subtract"
    solution = a - b
    operator_symbol = "-"
  when "multiply"
    solution = a * b
    operator_symbol = "*"
  when "divide"
    if b == 0
      prompt(TEXT[:divide_by_zero])
      return nil
    else
      solution = a % b == 0 ? a / b : a.to_f / b.to_f
      operator_symbol = "/"
    end
  else
    return nil
  end

  puts ">> #{a} #{operator_symbol} #{b} = #{solution}"
  solution
end

loop do
  prompt(TEXT[:welcome])
  number_one = get_number
  number_two = get_number
  operation = get_operation
  # binding.pry
  if operation == "quit"
    prompt(TEXT[:goodbye])
    break
  end
  perform_operation(operation, number_one, number_two)
end
