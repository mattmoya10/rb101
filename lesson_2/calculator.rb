def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(operation)
  case operation
  when '1'
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  else
    "Dividing"
  end
end

num1 = 0
num2 = 0
name = ''
op = ''

prompt("Welcome to the Calculator! Enter your name:")
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  # Ask the user for two numbers
  loop do
    prompt("Enter the first number:")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  loop do
    prompt("Enter the second number:")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  # Ask the user for an operation to perform
  operator_prompt = <<-MSG
  What operation would you like to perform? 
      1) Addition 
      2) Subtraction 
      3) Multiplication 
      4) Division
  MSG

  prompt(operator_prompt)
  loop do
    op = gets.chomp
    if %w(1 2 3 4).include?(op)
      break
    else
      prompt("Must choose 1,2,3 or 4")
    end
  end

  prompt("#{operation_to_message(op)} the two numbers...")

  # Perform the operation on the two numbers
  result = case op
           when "1"
             num1.to_i + num2.to_i
           when "2"
             num1.to_i - num2.to_i
           when "3"
             num1.to_i * num2.to_i
           else
             num1.to_f / num2.to_f
           end

  # Output the result
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation?(Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator!")
