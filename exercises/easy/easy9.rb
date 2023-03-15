def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: an array and a hash
Output: Combine elements of the array and values of the hash to construct a greeting
Logical Operations
1) Print out greeting using string interpolation for a joined array with spaces and the keys to access values
=end

def greetings(array, hash)
  puts "Hello, #{array.join(" ")}!  Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

separator()

prompt("Exercise 2")
=begin
Input: a number
Output: two times the inputted number unless the input is a double number, which should be returned as is
Logical Operations
1) Convert input to string, assign return value to variable
2) Check if string size is even
  a) Slice string in half
  b) Check if first half of string equals second half
  c) Return string as integer
3) Return twice the input number
=end

def twice(num)
  string_num = num.to_s
  if string_num.size % 2 == 0
    halfway = string_num.size / 2
    first_half = string_num.slice(0...halfway)
    second_half = string_num.slice(halfway..-1)
    first_half == second_half ? num : num * 2
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

separator()

prompt("Exercise 3")
=begin
Input: an integer
Output: array of all integers, in sequence, between 1 and the input
Logical Operations
1) Create a counter variable - initialize it to 1
2) Create an empty array to reference the output
3) Create a loop until counter variable reaches the input value
  a) Add the value referenced by the counter variable to the array
  b) Increment the counter variable by 1
4) Return resulting array
=end

def sequence(integer)
  counter = 1
  output_array = []
  loop do
    break if counter > integer
    output_array << counter
    counter += 1
  end
  output_array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

separator()

prompt("Exercise 4")
=begin
Input: a string
Output: an array that contains every word from the string, to which you have appended a space and the word length
Logical Operations
1) Create a variable and have it reference the array resulting from splitting the inputted string
2) Create an empty array to reference the output
3) Loop through the array referencing the strings
  a) Create a variable to reference each string's size
  b) Append that value to the string
  c) Add the resulting string to the empty array
4) Return the resulting output array
=end

def word_lengths(string)
  words = string.split
  output = []
  words.each do |word|
    word_size = word.size.to_s
    output << word + " " + word_size
  end
  output
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

separator()

prompt("Exercise 5")
=begin
Input: a string containing a first name, a space and a last name
Output: a string that contains the last name, a comma, a space and the first name
Logical Operations
1) Split the input string, reverse resulting array, reference result with variable
2) Output the string with string interpolation
=end

def swap_name(string)
  string.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

separator()

prompt("Exercise 6")
=begin
Input: two integers, one is total count, the second is the first number in a sequence
Output: an array containing the same number of elements as the count, with the values of each element representing  multiples of starting number
Logical Operations
1) return empty array if count = 0
2) loop over the range of values from 1 to count with map
  a) first number  * current range value
=end

def sequence(count, first_num)
  return [] if count == 0
  (1..count).map {|x| first_num * x}
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

separator()

prompt("Exercise 7")
=begin
Input: three numbers
Output: the letter value associated with the average of the inputted numbers
Logical Operations
1) Create a variable and have it reference the average of the inputted numbers
2) Create a case statement to check against the grading rubric
=end

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3
  case
  when average >= 90 && average <= 100
    "A"
  when average >= 80 && average < 90
    "B"
  when average >= 70 && average < 80
    "C"
  when average >= 60 && average < 70
    "D"
  else
    "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

separator()

prompt("Exercise 8")
=begin
Input: nested array of fruits with quantities
Output: array that includes the fruit objects featured in accordance to the quantities provided
Logical Operations
1) Iterate through array with map
  a) use times method to add string object based on quantity value
=end

def buy_fruit(fruit_array)
  fruit_array.map do |fruit, num|
    [fruit] * num
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

separator()

prompt("Exercise 9")
=begin
Input:
Output: