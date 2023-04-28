def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: a text file
Output: the longest sentence that exists in that file
List of Problems
1) Need a method for reading a file
2) Need a method for identifying sentences based on the criteria provided
3) Need a method for identifying the length of the sentences
4) Need to print out the longest sentence as well as the word count of that sentence
Algorithm
1) Use the File.read method to method to read the file - save return value to variable
2) Pass regex expressions to the split method to create an array of sentences
3) Use the max_by method to isolate the sentences with the longest length
  - To do this, pass a block the the method that uses the split method again for each sentence in the array
    to produce further subarray of words in each sentence
  - Call the size method on those subarrays to determine the length of the sentence by word count
  - The max_by method will iterate over all of these values to return the sentences with the highest word count value
4) Use the strip method to remove whitespace from the longest sentence
5) Call split and size methods on the the longest sentence to determine word count for output
6) Return both the longest sentence and its associated word count
=end

def longest_sentence(filename)
  text_file = File.read(filename)
  sentences = text_file.split(/\.|\?|!/)
  longest_sentence = sentences.max_by {|sentence| sentence.split.size}
  longest_sentence = longest_sentence.strip
  word_count = longest_sentence.split.size
  puts "#{longest_sentence}"
  puts "Contains #{word_count} words"
end

longest_sentence("sample.txt")

prompt("Exercise 2")
=begin
Input: a string
Output: true/false based on whether or not the input can be spelling in accordance to spelling block rules
List of Problems
1) Need a strategy for how to organize and store the spelling blocks
2) Need a strategy for iterating through the input character by character - capital letters should be downsized
3) Need a strategy for checking the characters to the spelling blocks to determine true/false output
  - False output should be generated if the input contains both the letters on any given spelling block
  - True output should be generated if the entirety of the input can be created with at most one letter from
    each spelling block
Algorithm
1) Create a constant nested array that store all the spelling blocks
2) Use chars method on input to create an array of characters - store this in a variable
3) Create two methods for each test
  - False method should iterate through the sub-arrays to see if any of both the elements within exist
    within the character array
  - True method should call the all? method on the character array passing a block that iterates through
    the subarrays to ensure each character is contained within
4) If neither of the methods in step 3 return as true, return a string saying that the word cannot be created
  with the spelling blocks given
=end

SPELLING_BLOCKS = [["b", "o"], ["g", "t"], ["v", "i"], ["x", "k"], ["r", "e"],
                  ["l", "y"], ["d", "q"], ["f", "s"], ["z", "m"], ["c","p"], ["j", "w"],
                  ["n", "a"], ["h", "u"]]


def block_word?(string)
  word_chars = string.downcase.chars
  SPELLING_BLOCKS.each do |blocks|
    return false if blocks.all? {|char| word_chars.include?(char)}
  end
  true
end

p block_word?("BUTCH")
p block_word?("BATCH")
p block_word?("jest")

prompt("Exercise 3")
=begin
Input: a string
Output: a hash with 3 entries - lowercase, uppercase and noncharacters percentages of the input
List of Problems
1) Need a method for iterating through the input's characters and determining their category
2) Need to store the input size in advance to determine percentage's for the hash
3) Need a strategy for initializing the keys of the hash and setting the percentages
4) Need a method for storing and evaluating the percentages
Algorithm
1) Create variables for empty hash, each percentage category, size of input
2) Create constant arrays for all upcase, lowercase characters
3) Call chars on the input and iterate through the array returned
  - If the character is included in the lowercase array, increment appropriate variable
  - If the character is include in the uppercase array, increment appropriate variable
  - If not in either array, increment remaining variable category
4) Create the hash values by dividing each percentage category variable by size of the input
  Keys are the percentage categories themselves
5) Return hash
=end

UPPERCASE = ("A".."Z").map {|letter| letter}
LOWERCASE = ("a".."z").map {|letter| letter}

def letter_percentages(string)
  result = {}
  lowercase = 0
  uppercase = 0
  neither = 0
  string_length = string.size
  string.chars.each do |char|
    if UPPERCASE.include?(char)
      uppercase += 1
    elsif LOWERCASE.include?(char)
      lowercase += 1
    else
      neither += 1
    end
  end
  result[:lowercase] = (lowercase / string_length.to_f) * 100
  result[:uppercase] = (uppercase / string_length.to_f) * 100
  result[:neither] = (neither / string_length.to_f) * 100
  result
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')

prompt("Exercise 4")
=begin
Input: a string
Output: true or false depending on whether all paretheses in input are perfectly balanced
List of Problems
1) Need a strategy for determining whether or not the open and close parantheses are in the correct order
  if they are perfectly balanced
2) Need a strategy for determining whether or not the open and close parentheses are in the same quantities
  so that they can be checked for balance
3) Need a strategy for iterating through the input string applying appropriate conditionals
Algorithms
1) Create a count variable to track parentheses opening and closing
    Open parentheses resemble +1, Close parentheses resemble -1 to the count
2) Iterate through the input string
    - For every instance of an open parentheses, increase count by 1
    - For every instance of a close parentheses, decrease count by 1
    - If the count ever goes below zero, return a false value
3) Return true if count equals zero, false in all other scenarios
=end

def balanced?(string)
  count = 0
  string.each_char do |char|
    count += 1 if char == "("
    count -= 1if char == ")"
    return false if count < 0
  end
  count.zero?
end

p balanced?('What (is) this?')
p balanced?('What is) this?')
p balanced?('What (is this?')
p balanced?('((What) (is this))?')
p balanced?('((What)) (is this))?')
p balanced?('Hey!')
p balanced?(')Hey!(')
p balanced?('What ((is))) up(')

# The parentheses in this problem are analogous to a switch that turns on or off

prompt("Exercise 5")
=begin
Input: the lengths of 3 sides of a triangle
Output: a symbol illustrating what type of triangle it is or if its invalid
List of Problems
1) Need to have a strategy for comparing and working with the three inputs
2) Need to establish the conditionals that will determine the output
Algorithm
1) Place the 3 input values into an array for access to functionality that assist with conditionals
2) Check for invalid triangle
  - Sum up all values of array, find max value of the elements in the array
  - If the max value is less than or equal to the difference between the sum and max value and the max value
    itself, return :invalid
  - If any element in the array is 0, return :invalid
3) Check for equilateral
  - All elements of the array have to be identical; use all? method and comparison operator
4) Check for isosceles
  - Make a conditional with the three comparisons among the elements to determine if any two are identical
5) Check for scalene
  - All elements of the array must be different; use all? method and comparison operator
=end

def triangle(length1, length2, length3)
  triangle = [length1, length2, length3]
  sum_of_sides = triangle.sum
  longest_side = triangle.max
  if (sum_of_sides - longest_side) <= longest_side || triangle.any? {|side| side == 0}
    :invalid
  elsif triangle.all?(length1)
    :equilateral
  elsif length1 == length2 || length2 == length3 || length1 == length3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

prompt("Exercise 6")
=begin
Input: 3 integer values representing angle degree measurements
Output: a symbol that reflects the appropriate category of triangle depending on angle rules
List of Problems
1) Need the conditionals for each category of triangle plus invalid triangles
2) Need a good way to work with the inputs in accordance to the conditionals
Algorithm
1) Create an array with the 3 input values
2) Check for invalid triangle
  - Use sum method on array to ensure the total is 180 degrees
  - Use any? method on array to check for any inputs equal to 0
  - If first is false or second is true, return invalid
3) Check for right triangle
  - Use any? method on array to check for any inputs equal to 90
  - If so, return right
4) Check for acute triangle
  - Use all? method on array to check that all inputs are less than 90
  - If so, return acute
5) Check for obtuse
  - Use any? method on array to check if any inputs are greater than 90
  - If so, return obtuse
=end

def triangle2(deg1, deg2, deg3)
  triangle = [deg1, deg2, deg3]
  degree_sum = triangle.sum
  case
  when degree_sum != 180, triangle.any? {|deg| deg == 0}
    :invalid
  when triangle.any? {|deg| deg == 90}
    :right
  when triangle.all? {|deg| deg < 90}
    :acute
  else
    :obtuse
  end
end

p triangle2(60, 70, 50) == :acute
p triangle2(30, 90, 60) == :right
p triangle2(120, 50, 10) == :obtuse
p triangle2(0, 90, 90) == :invalid
p triangle2(50, 50, 50) == :invalid

prompt("Exercise 7")
=begin
Input: an integer representing a specific year
Output: the number of friday the 13ths in the inputted year
List of Problems
1) How to isolate the 13th day of every month in a year?
2) How to determine whether or not that particular day is a Friday
Algorithm
1) Will create new date objects for every month of the year, specifying the 13th day of that month
  - data.new(year,month,date)
  - year == input, data == 13, month == 1-12
2) Use count method to determine how many of those data objects reflect a friday w/ friday? method
=end

require "date"

def friday_13th(year)
  dates = (1..12).map {|month| Date.new(year, month, 13)}
  dates.count {|element| element.friday? == true}
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

prompt("Exercise 8")
=begin
Input: an integer
Output: the next featured number that is greater than the input
Featured Number: an odd number that is a multiple of 7, whose digits occur exactly once each
List of Problems
1) Need a strategy for intelligently iterating through all numbers beyond the input
2) Need to check whether numbers are odd, multiples of 7 and digits occur exactly once
3) Need to check when a condition for a featured number cannot possibly be met, in the case of a 10 digit number
Algorithm
1) Set result equal to the input plus 1
2) Loop through every value including and beyond that value
  - If .odd? method return false go next
  - If result is not a multiple of 7 go next
  - Break if all the digits are unique
    - Convert to string and use uniq and size method
3) Before all this check to see if 10 digit number with to_s and size method
=end
=begin
def featured(integer)
  result = integer + 1
  result += 1 until result.odd? == true && result % 7 == 0
  loop do
    digits = result.to_s.split("")
    return result if digits.uniq == digits
    result += 14
    break if result >= 9_876_543_210
  end
  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999)

=end

prompt("Exercise 9")
=begin
Input: an array
Output: the same array mutated with a bubble sort
List of Problems
1) Need a method for checking every element of the array with its subsequent element; do not do this for last element
2) Need a method for destructively swapping elements as needed
3) Need to be sure to not iterate over elements that are already guaranteed to be in the correct spot aka the final element on each pass
Algorithm
1) Create a variable to reference the final index with which to iterate to for the sake of comparisons
2) Use nested for loop to iterate through each element of the array for each element of the array
  - Check element at current index with the element at subsequent index
  - If larger, swap the elements with setter method
  - Decrement on final index variable by one before moving on
3) Return array
=end

def bubble_sort!(array)
  final_index = array.size - 2
  index = 0
  loop do
    for index in (0..final_index) do
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
    break if final_index == 0
    final_index -= 1
  end
  array
end

array = [5, 3]
p bubble_sort!(array)


array = [6, 2, 7, 1, 4]
p bubble_sort!(array)


array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)

prompt("Exercise 10")
=begin
Input: an integer
Output: the difference between the square of the sum of the first n integers and the sum of the squares of the first n integers
List of Problems
1) Need to properly square the sum of a group of integers
2) Need to properly sum up the square of each integer in a group of integers
3) Subtract the ladder from the former
Algorithm
1) Use inject on the range of integer 1..input passing the :+ symbol as an argument. Square the return value
2) Use the sum method of the range of integer 1..input passing a block to it that squares each element
3) Subtract the return value of step 2 to the return value of step 1
=end

def sum_square_difference(integer)
  square_sum = ((1..integer).inject(:+)) ** 2
  sum_square = (1..integer).sum {|num| num ** 2}
  square_sum - sum_square
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

