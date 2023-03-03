def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: an array of numbers
Output: the sum of the sums of each leading subsequence for the inputted array.
Logical Ops
1) Create a variable for running total
2) Loop through each number in the array
  a) add each element to the variable created in step 1
3) Return the resulting running total
=end

def sum_of_sums(array_of_nums)
  output = 0
  values = 0
  array_of_nums.each do |element|
    values += element
    output += values
  end
  output
end

p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])

separator()

prompt("Exercise 2")
=begin
Input: a string
Output: an array of all substrings that start at the beginning of the inputted string
Logical Ops
1) Create a variable assigned to an empty string
2) Create an empty array for the output
3) Iterate through each character of the string
  a) Add the character to the empty string
  b) Add resulting string to array
4) Return array
=end

def leading_substrings(string)
  substrings = ''
  output_array = []
  string.each_char do |char|
    substrings += char
    output_array << (substrings)
  end
  output_array
end

p leading_substrings('abc')
p leading_substrings('a')
p leading_substrings('xyzzy')

separator()

prompt("Exercise 3")
=begin
Input: a string
Output: a list of all substrings
Logical Ops
1) Create an empty array for the output
2) Loop through the string until it is empty
  a) Pass the string value to method created in previous exercise
  b) Add returned array to the empty array created in step 1
3) Return the output array after flattening it
=end

def substrings(string)
  output_array = []
  while string != ""
    output_array << leading_substrings(string)
    string.slice!(0)
  end
  output_array.flatten
end

p substrings('abcde')

separator()

prompt("Exercise 4")
=begin
Input: a string
Output: a list of all substrings within the inputted string that are also palindromic
Logical Operations
1) Call the substring method, passing the inputted string as an argument
2) Create a variable and assign it to reference the return value of the method
3) Create a variable to reference the output array - initialize it to an empty array
4) Initiate a loop through each element of the array referenced by the created variable
  a) If any of the individual substring are identical to its reverse add it to the empty array
5) Return the variable referencing the resulting array
=end

def palindromes(string)
  array_of_substrings = substrings(string)
  output_array = []
  array_of_substrings.map do |substring|
    if substring.size == 1
      next
    else
      output_array << substring if substring == substring.reverse
    end
  end
  output_array
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')

separator()

prompt("Exercise 5")
=begin
Input: a starting number and an ending number representing a range of numbers
Output: print out all numbers in the range in accordance to rules
Logical Operations
1) Create for loop using the input values as the range
2) Create a new method that takes each value within the range and performs the test, output the return value that needs to be printed
=end

def fizzbuzz_check(num)
  case
  when num % 3 == 0 && num % 5 == 0
    "fizzbuzz"
  when num % 5 == 0
    "buzz"
  when num % 3 == 0
    "fizz"
  else
    num
  end
end

def fizzbuzz(start_num, end_num)
  for numbers in start_num..end_num
    puts fizzbuzz_check(numbers)
  end
end

fizzbuzz(1, 15)

separator()

prompt("Exercise 6")
=begin
Input: a string
Output: a new string in which every character is doubled
Logical Operations
1) Create an empty string to represent the output
2) Cycle through each character of the input string
  a) Add that character to the empty string twice
3) Return the resulting string
=end

def repeater(string)
  output_string = ""
  string.each_char {|char| 2.times {|x| output_string << char}}
  output_string
end

p repeater('Hello')
p repeater("Good job!")
p repeater('')

separator()

prompt("Exercise 7")
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  output_string = ""
  string.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      2.times {|x| output_string << char}
    else
      output_string << char
    end
  end
  output_string
end

p double_consonants('String')
p double_consonants("Hello-World!")
p double_consonants("July 4th")
p double_consonants('')

separator()

prompt("Exercise 8")
=begin
Input: a string
Output: a new string with the words in reverse order
Logical Operations
1) Create a variable that references an empty string - the eventual output
2) Split the input string into words - returns an array
3) Create a variable to reference the index values of the array - initialize to final element in array
4) Create a while loop that iterates through this array from the last index to 0
  a) Add array element to empty string
  b) Decrement on the index variable
5) Return the resulting string
=end

=begin
def reverse_sentence(string)
  output_string = ""
  word_array = string.split()
  index = word_array.size - 1
  while index >= 0
    output_string << word_array[index]
    output_string << " "
    index -= 1
  end
  output_string
end
=end

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

p reverse_sentence('Hello World')
p reverse_sentence('Reverse these words')
p reverse_sentence('')
p reverse_sentence('    ')

separator()

prompt("Exercise 9")
=begin
Input: a string containing one or more words
Output: the given string with words that containt five or more characters reversed
Logical Operations
1) Create a variable and have it reference an empty array
2) Split the inputted string and iterate through the elements of the resulting array
  a) If element has a size of 5 or greater, reverse it with a destructive method
  b) Add element to the empty array
3) Join the array and return the resulting string
=end

def reverse_words(string)
  output = []
  string.split.each do |word|
    word.reverse! if word.size >= 5
    output << word
  end
  output.join(" ")
end

p reverse_words('Professional')
p reverse_words('Walk around the block')
p reverse_words('Launch School')

separator()

prompt("Exercise 10")
=begin
Input: an array of integers
Output: the average of all the numbers in the array represented as an integer
Logical Operations
1) Create a variable to reference the sum total of all integers in the array - initialize to 0
2) Iterate through all numbers of the array
  a) Add the number to the sum variable
3) Divide the resulting value by the size of the array
4) Return the result
=end

def average(array_of_integers)
  sum = 0
  array_of_integers.each {|num| sum += num}
  sum / array_of_integers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40