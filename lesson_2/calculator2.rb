# Verifying Valid Input for Calculator
def valid_input?(input)
  input.to_f > 0 || input.empty?
end

# Displaying Messages
def prompt(string)
  puts ">> #{string}"
end

# Getting Input
def get_input(string)
  prompt(string)
  gets.chomp
end

prompt("Welcome to the Loan Calculator!")

# Main loop
loop do
  loan_amount = ''
  duration = ''
  annual_rate = ''

  loop do # Gathering necessary input
    loan_amount = get_input("What is the loan amount?")
    annual_rate = get_input("What is your annual interest rate?")
    duration = get_input("What is the loan duration?")
    if valid_input?(loan_amount) && valid_input?(annual_rate) && valid_input?(duration)
      break
    else
      prompt("Looks like some of your input was not valid, try again")
    end
  end

  # Executing necessary conversions
  monthly_rate = (annual_rate.to_f) / 100
  duration = duration.to_i
  loan_amount = loan_amount.to_f

  # Performing main calculation
  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration)))
  prompt("Your monthly payment is #{monthly_payment}")

  # Asking user if they have more to calculate
  continue = get_input("Would you like to calculate some more? (y/n)")
  break unless continue.downcase.start_with?("y")
end

prompt("Thank you for using the Loan Calculator!")
