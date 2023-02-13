VALID_CHOICES = { "rock" => "r", "paper" => "p",
                  "scissors" => "s", "lizard" => "l",
                  "spock" => "sp" }

WIN_CONDITIONS = { "r" => ["s", "p"], "s" => ["p", "l"], "p" => ["r", "sp"],
                   "l" => ["p", "sp"], "sp" => ["r", "s"] }

def prompt(message)
  puts("=> #{message}")
end

def valid_input(string)
  VALID_CHOICES.include?(string) || VALID_CHOICES.value?(string)
end

def convert_player_choice_for_display(string)
  if VALID_CHOICES.include?(string)
    string
  else
    VALID_CHOICES.key(string)
  end
end

def convert_player_choice_for_game(string)
  if VALID_CHOICES.include?(string)
    VALID_CHOICES[string]
  else
    string
  end
end

def win?(first, second)
  WIN_CONDITIONS[first].include?(second)
end

def calculate_result(player, computer)
  if win?(player, computer)
    "You win!"
  elsif player == computer
    "It's a tie!"
  else
    "Sorry, you lose!"
  end
end

computer_score = 0
player_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: Rock(r), Paper(p), Scissors(s), Lizard(l), Spock(sp)")
    choice = gets.chomp.downcase
    if valid_input(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{convert_player_choice_for_display(choice)}, " \
         "the computer chose: #{VALID_CHOICES.key(computer_choice)}")

  final_result = calculate_result(convert_player_choice_for_game(choice),
                                  computer_choice)
  prompt(final_result)

  if final_result == "You win!"
    player_score += 1
  elsif final_result == "Sorry, you lose!"
    computer_score += 1
  end
  prompt("The running score is Player: #{player_score}, " \
          "Computer: #{computer_score}")

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock!")
