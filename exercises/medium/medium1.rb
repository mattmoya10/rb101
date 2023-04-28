def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: an array
Output: a new array representing the inputted array with the first element rotated to the end
Logical Operations
1) Reference the inputted array from all indices going from the second to the last
2) Append the first element of the inputted array to it
3) Return the resulting array
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

prompt("Exercise 2")
=begin
Input: an integer, the number of digits at the end to be rotated
Output: an integer, where the specified number of digits have been rotated in the same manner as in exercise 1
Logical Operations
1) Convert inputted integer into a string
2) Transform that string into an array of characters
3) Slice the array for the specified number of digits
4) Use the rotate_array method to rotate appropriately
5) Join the resulting array with the original array
=end

def rotate_rightmost_digits(integer, digits)
  if digits == 1
    integer
  else
    string = integer.to_s
    array_of_chars = string.chars
    rotated_array_of_chars = rotate_array(array_of_chars.slice!(-digits..-1))
    (array_of_chars + rotated_array_of_chars).join.to_i
  end
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

prompt("Exercise 3")
=begin
Input: an integer
Output: the maximum rotation of that argument.
Logical Operations
1) Convert inputted integer into a string, takes its size and and assign it to a variable
2) Call a while loop that calls rotate_rightmost_digits while variable is not 0
3) Store rotated number in a result variable and iterate on the variable created in 1
=end

def max_rotation(integer)
  num_of_digits = integer.to_s.size
  result = 0
  while num_of_digits > 0
    result = rotate_rightmost_digits(integer, num_of_digits)
    integer = result
    num_of_digits -= 1
  end
  result
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

prompt("Exercise 4")
=begin
Input: an integer
Output: an array that shows which switches are still left on after process
List of Problems
1) Need a data structure to contain the information for all switches (hash)
  - Create constants for the strings "on" and "off"
  - Keys should correspond to integer values from 1 to n
  - Should be its own method, as the hash created will depend on the input provided
2) Need a way to iterate through all multiples of every integer from 1 to n
  - Have a method that generates an array of multiples for a specific number from 1 to n
  - Remember to pass the value of n to know how many multiples to include
  - Return the array for use in main program
3) As we iterate through the multiples, need to switch the value of the correct key
4) After successfully going through all the multiples, cycle through the hash again
  looking to add all keys that have a value of "on" into an array
5) Return that array
=end

ON = "on"
OFF = "off"

def initialize_switches(switch_count)
  switch_list = {}
  (1..switch_count).each do |num|
    switch_list[num] = ON
  end
  switch_list
end

def find_multiples(multiples, limit)
  (2..limit).select do |num|
    num % multiples == 0
  end
end

def switches_left_on(switch_hash)
  result = []
  switch_hash.each do |key, value|
    result << key if value == ON
  end
  result
end

def switches(integer)
  switch_list = initialize_switches(integer)
  (2..integer).each do |num|
    list_of_multiples = find_multiples(num, integer)
    list_of_multiples.each do |x|
      if switch_list[x] == ON
        switch_list[x] = OFF
      else
        switch_list[x] = ON
      end
    end
  end
  switches_left_on(switch_list)
end

p switches(10)
p switches(5)

prompt("Exercise 5")
=begin
Input: an odd integer
Output: a 4 pointed diamond in an nxn grid made of asterisks where n is the provided integer
List of Problems
1) Need a way to determine how to print asterisks in their appropriate spot for each line
  - Noticing the vertical symmetry of a diamond, we only need to determine the number of asterisks
    to put on a specific line as well as the number of spaces that come immediately before them
  - The number of asterisks will be each odd integer between 1 and the input
  - The number of spaces preceding the asterisks is equal to the distance away from the horizontal line
    of symmetry (base case)
2) Need to work through the variations from line to line
  - Recognizing the horizontal symmetry, we can notice that the bottom half of the diamond is the
    mirror image of the top and focus our energy on getting the top half correct first
  - Can track the distance from the "base case" or line of symmetry to tag an identifier to each line -
    the distance will be equal to the floor value of the input divided by 2.  Perhaps use absolute value
    to help track the lines of the bottom half of the triangle
Algorithm
1) Create variables for distance_from_center, list of numbers representing asterisk count, index of array
2) Loop through all values from -distance_from_center to distance_from_center
  - Print the number of spaces
  - Print the number of asterisks
  - Increment on index value
=end

def diamond(odd_integer)
  distance_from_center = (odd_integer / 2).floor
  asterisk_count = (1..odd_integer).select {|num| num if num.odd?}
  index = 0
  (-distance_from_center..distance_from_center).each do |line|
    if line < 0
      puts (" " * (line).abs) + ("*" * asterisk_count[index])
      index += 1
    elsif line == 0
      puts (" " * (line).abs) + ("*" * asterisk_count[index])
    else
      index -= 1
      puts (" " * (line).abs) + ("*" * asterisk_count[index])
    end
  end
end

diamond(1)
separator
diamond(3)
separator
diamond(7)

prompt("Exercise 6")
=begin
Input: a string representing a list of commands or numbers to be placed in the stack
Output: the appropriate output given the commands
List of Problems
1) Need to read the input effectively and iterate through it to perform meaningful commands
2) Create methods for each of the commands based on descriptions of them
3) Create a stack based on the integers that appear in the input
Algorithm
1) Use split on the input to convert string to array with each command
2) Create register variable and initialize to 0
3) Create methods for each of the commands based on description
  - If integer, just set the register variable equal to that value
4) Create an empty array to represent the stack
5) Iterate through the split up array to execute the commands
=end

def PUSH(value, stack)
  stack.push(value)
  stack
end

def ADD(value, stack)
  add_num = stack.pop()
  value + add_num
end

def SUB(value, stack)
  sub_num = stack.pop()
  value - sub_num
end

def MULT(value, stack)
  mult_num = stack.pop()
  value * mult_num
end

def DIV(value, stack)
  div_num = stack.pop()
  value / div_num
end

def MOD(value, stack)
  mod_num = stack.pop()
  value % mod_num
end

def POP(stack)
  stack.pop()
end

def PRINT(value)
  puts value
end

def minilang(program_string)
  program = program_string.split
  register = 0
  stack = []
  program.each do |command|
    case command
    when "PUSH"
      stack = PUSH(register, stack)
    when "ADD"
      register = ADD(register, stack)
    when "SUB"
      register = SUB(register, stack)
    when "MULT"
      register = MULT(register, stack)
    when "DIV"
      register = DIV(register, stack)
    when "MOD"
      register = MOD(register, stack)
    when "POP"
      register = POP(stack)
    when "PRINT"
      PRINT(register)
    else
      register = command.to_i
    end
  end
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')

prompt("Exercise 7")
=begin
Input: a sentence string
Output: same string with any sequence of the number words converted to string digits
List of Problems
1) Need a way to search through the input string to find the words that need substituting w/o creating new string
2) Need a conversion table from string words to string digits
Algorithm
1) Use the gsub! method to create substitions
2) Create a constant Hash that creates key, value pairs to handle conversions
3) Iterate through all elements of the hash
  - Substitute every instance of a number word with the appropriate hash value destructively
=end

NUMBER_CONVERSION = {"zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5",
                    "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}

def word_to_digit(sentence)
  NUMBER_CONVERSION.keys.each do |number_word|
    sentence.gsub!(/\b#{number_word}\b/, NUMBER_CONVERSION[number_word])
  end
  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

prompt("Exercise 8")
=begin
Input: an integer representing a position in the Fibonacci sequence
Output: an integer that represents the Fibonacci value at that position
Constraints: Must use recursion
List of Problems:
1) Devise an algorithm that returns the Fibonacci value based on a given position
Algorithm
1) Base Case of anything less than 2
2) Have the function call itself with past two positions
=end

def fibonacci(pos)
  if pos < 2
    pos
  else
    fibonacci(pos - 1) + fibonacci(pos - 2)
  end
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(12)
p fibonacci(20)

prompt("Exercise 9")
=begin
Input: an integer position
Output: the corresponding integer associated with that position in the Fibonacci sequence
List of Problems
1) Need a way to store two digits - the last two digits in the sequence
2) Need to find a way to generate and iterate through the Fibonacci sequence
Algorithm
1) Create an array that references the last two digits in the sequence - initialize to base case of Fibonacci sequence [1, 1]
2) Iterate through the range of position 3 to the input
  - Reassign the values of the array appropriately based on Fibonacci algorithm
=end

def Fibonacci(pos)
  num1, num2 = [1, 1]
  (pos - 2).times {num1, num2 = [num2, num2 + num1]}
  num2
end

p Fibonacci(20)
p Fibonacci(100)

prompt("Exercise 10")
=begin
Input: an integer position
Output: the last digit of the Fibonacci number in that position of the sequence
List of Problems
1) Need a method of isolating the last digit of the fibonacci number
Algorithm
1) Use the method from the previous exercise
2) Use modulo 10 to get the remainder of the return value of said function and return that instead
=end

def Fibonacci1(pos)
  num1, num2 = [1, 1]
  (pos - 2).times {num1, num2 = [num2, num2 + num1]}
  num2 % 10
end

p Fibonacci1(20)
p Fibonacci1(100)