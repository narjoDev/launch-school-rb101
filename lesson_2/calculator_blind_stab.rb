require "pry"

def get_number
  loop do
    puts ">> Please enter a number:"
    number = gets.chomp
    if number.to_i.to_s == number
      return number.to_i
    else
      puts ">> Invalid input, please try again."
    end
  end
end

def get_operation
  loop do
    puts ">> Please specify an operation " \
       + "(add, subtract, multiply, divide, quit)"
    operation = gets.chomp.downcase
    if %w(add subtract multiply divide quit).include?(operation)
      return operation
    else
      puts ">> Invalid input, please try again."
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
    return nil if b == 0
    solution = a / b
    operator_symbol = "/"
  else
    return nil
  end

  puts ">> #{a} #{operator_symbol} #{b} = #{solution}"
  solution
end

loop do
  puts ">> Welcome to the calculator."
  number_one = get_number
  number_two = get_number
  operation = get_operation
  binding.pry
  break if operation == "quit" && (p "Goodbye.")
  perform_operation(operation, number_one, number_two)
end
