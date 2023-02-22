def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
def ascii_value(string)
  total = 0
  string.each_char {|char| total += char.ord}
  total
end

puts ascii_value("Four score")
puts ascii_value("Launch School")
puts ascii_value("a")

separator()

prompt("Exercise 2")
# Input: An integer
# Output: A string displaying time in hours and minutes
# Logical Ops:1) converting input into hours and minutes
#             2) addressing + or - input
#             3) converting integers into strings and disply

def convert_to_time(integer)
  integer.abs.divmod(60)
end

def time_of_day(integer)
  if integer >= 0
    hours = convert_to_time(integer)[0]
    minutes = convert_to_time(integer)[1]
  else integer < 0
    hours = 23 - convert_to_time(integer)[0]
    minutes = 60 - convert_to_time(integer)[1]
  end
  format("%.2d:%.2d", hours, minutes)
end

puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(-1437)
puts time_of_day(800)

separator()

prompt("Exercise 3")
=begin
Input: string submitted in time format hh:mm
Output: integer within the range of 0-1439 that expresses the number
        of minutes before and after midnight
Logical Ops: method to convert string input into integers
             method to convert hours to minutes and total result with existing minutes
             main methods will handle positive/negative issue
=end

def convert_input(string)
  string.split(":")
end

def convert_to_time(array)
  (array[0].to_i * 60) + (array[1].to_i)
end

def after_midnight(string)
  minutes = convert_to_time(convert_input(string))
  return 0 if minutes > 1439
  convert_to_time(convert_input(string))
end

def before_midnight(string)
  minutes = convert_to_time(convert_input(string))
  if minutes == 0 || minutes > 1439
    0
  else
    1440 - minutes
  end
end

puts after_midnight('00:00')
puts before_midnight('00:00')
puts after_midnight('12:34')
puts before_midnight('12:34')
puts after_midnight('24:00')
puts before_midnight('24:00')

separator()

prompt("Exercise 4")
=begin Input: a string of words separated by spaces
       Output: the inputted string where each word has the first and last letters swapped
       Logical Ops: separate inputted string into words to operated on individually (string into array)
                    swap first and last letter of words (string into string)
                    rejoin all words into a new string in main method
=end

def sentence_to_words(sentence)
  sentence.split(" ")
end

def letter_swap(word_array)
  word_array.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  word_array
end

def swap(sentence)
  letter_swap(sentence_to_words(sentence)).join(" ")
end

puts swap('Oh what a wonderful day it is')
puts swap('Abcde')
puts swap('a')

separator()

prompt("Exercise 5")
=begin Input: a string of all lowercased words occasionally consisting of non-alphabetic characters
       Output: the inputted string with all the non alphabetic characters replaced by spaces.  More than
               one of such characters should be replaced by a single space
       Logical Ops: remove all non alphabetic characters and replace them with spaces unless a space already exists before it (string to array)
                    convert the array into a string to be outputted
=end

ALPHABET = ("a".."z").to_a

def cleanup(weird_string)
  clean_string = []
  weird_string.each_char do |letter|
    if ALPHABET.include?(letter)
      clean_string << letter
    else
      clean_string << " " unless clean_string.last == " "
    end
  end
  clean_string.join
end

p cleanup("---what's my +*& line?")

separator()

prompt("Exercise 6")
=begin Input: a string with one or more space separated words
       Output: a hash that shows the number of words of different sizes
       Logical Ops: create an array of the lengths of each word
                    identify each unique element of that array and return them as - keys to hash
                    identify how many elements of the array match the length of each unique element identified in last op - values of hash
                    create hash
=end

def word_sizes(sentence)
  counts = Hash.new(0)
  sentence.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")

separator()

prompt("Exercise 7")
def word_sizes2(sentence)
  counts = Hash.new(0)
  sentence.split.each do |word|
    counts[word.delete("^A-Za-z").size] += 1
  end
  counts
end

p word_sizes2('Four score and seven.')
p word_sizes2('Hey diddle diddle, the cat and the fiddle!')
p word_sizes2("What's up doc?")

separator()

prompt("Exercise 8")
=begin
Input: an array of integers between 0-19
Output: returns an array of those integers sorted based on english words for each number
Logical Ops: create a hash constant containing all the number to english word conversions
             loop through each element of the input array and compare it to the next element based on hash value, swap if needed
             return new array
=end

ENGLISH_NUMBERS = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
                  10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
                  18 => "eighteen", 19 => "nineteen"}

def alphabetic_number_sort(array)
  counter = 0
  while counter < array.size
    index = 0
    while index != array.size - 1
      if ENGLISH_NUMBERS[array[index]] > ENGLISH_NUMBERS[array[index + 1]]
        array[index], array[index + 1] = array[index + 1], array[index]
        index += 1
      else
        index += 1
      end
    end
    counter += 1
  end
  array
end

p alphabetic_number_sort((0..19).to_a)

separator()

prompt("Exercise 9")
=begin
Input: a string
Output: the inputted string with all consecutive duplicates collapsed
Logical Ops
1) will not want to directly mutate the inputted string as I loop through it so will need a new string
2) loop through the inputted string adding a character to the new string only if it does not equal the next character in the inputted string
=end

def crunch(string)
  output = ""
  counter = 0
  while counter <= string.size - 1
    output << string[counter] unless string[counter] == string[counter + 1]
    counter += 1
  end
  output
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')

separator()

prompt("Exercise 10")

puts "It is a different object"

separator()

prompt("Exercise 11")
=begin
Input: a positive integer
OutPut: returns a array of digits contained within the input
Logical Ops
1) Use division to systematically break down the input from right to left
2) Add numbers to the array
=end

def digit_list(integer)
  digits = []
  loop do
    integer, digit = integer.divmod(10)
    digits << digit
    break if integer == 0
  end
  digits.reverse
end

p digit_list(12345)
p digit_list(7)
p digit_list(375290)
p digit_list(444)
