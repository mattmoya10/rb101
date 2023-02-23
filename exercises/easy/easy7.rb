def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: two arrays
Output: a new array containing all the elements of both of the inputted arrays, with their elements taken in alteration
Logical Ops
1) Create a new array to store the values of the inputted arrays in alteration
2) Create a counter variable for a while loop
3) Initiate the while loop to iterate through inputted arrays until there are no more elements
  a) add to the result array the first element of the first inputted array referenced by the counter value as an index
  b) add to the result array the first element of the second inputted array
  c) increment the counter value
4) Return array created in step 1
=end

def interleave(array1, array2)
  result = []
  counter = 0
  while counter < array1.size
    result << array1[counter]
    result << array2[counter]
    counter += 1
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c'])

separator()

prompt("Exercise 2")
=begin
Input: a string
Output: a hash containing 3 entries: the number of characters in the input that are lowercase, the number of characters that are
uppercase and the number of characters that are neither
Logical Ops
1) Create two arrays containing an explicit lists of all the uppercase and lowercase letters of the alphabet
2) Create the output hash with default values set to zero
3) Initiate the loop based on each character of the string
  a) Checking if each character is included in either of the arrays created in step 1
  b) If it does, initialize the corresponding symbol key and increment its value by 1
  c) If it does not, initialize the neither key and increment its value by 1
4) Return the hash created
=end

ALPHA1 = ("a".."z").to_a
ALPHA2 = ("A".."Z").to_a

def letter_case_count(string_input)
  final_hash = {lowercase: 0, uppercase: 0, neither: 0}
  string_input.each_char do |char|
    if ALPHA1.include?(char)
      final_hash[:lowercase] += 1
    elsif ALPHA2.include?(char)
      final_hash[:uppercase] += 1
    else
      final_hash[:neither] += 1
    end
  end
  final_hash
end

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')

separator()

prompt("Exercise 3")
=begin
Input: a string
Output: a new string that contains the inputted string with the initial character of every word capitalized and all other letters lowercase
Logical Ops
1) Create an array containing each word of inputted string as elements
2) Iterate over each element of array
  a) Perform capitalize method
3) Convert array back into string
4) Return string
=end

def word_cap(string)
  word_list = string.split
  word_list.each {|word| word.capitalize!}
  word_list.join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
puts word_cap('this is a "quoted" word')

separator()

prompt("Exercise 4")
=begin
Input: a string
Output: a new string where every uppercase letter of the inputted string is replaced by its lowercase version and vice versa.  All other characters unchanged
Logical Ops
1) Create constants that represent all alphabet characters both lowercase and uppercase
2) Initiate a loop that cycles through each character of string
  a) If found in lowercase, uppercase it
  b) If found in uppercase, lowercase it
  c) If not found in either, go to next iteration
3) Return string
=end

def swapcase(string)
  result = ""
  string.each_char do |char|
    if ALPHA1.include?(char)
      result << char.upcase
    elsif ALPHA2.include?(char)
      result << char.downcase
    else
      result << char
    end
  end
  result
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')

separator()

prompt("Exercise 5")
=begin
Input: string
Output: a new string containing the inputted string in which every other character is capitalized and the remaining are lowercase.
        Characters that are not letters should not be changed but should count as characters
Logical Ops
1) Create the new string to be the output
2) Create a counter variable for a loop
3) Initiate a while loop that iterates through the inputted string
  a) Leverage the counter as an index - all even chars at even indices and zero should be upcased
  b) Add the resulting char to the output string made in step 1
  c) Increment on counter
4) Return the completed string
=end

def staggered_case(string)
  new_string = ""
  counter = 0
  while counter < string.size
    if counter % 2 == 0
      new_string << string[counter].upcase
    else
      new_string << string[counter].downcase
    end
    counter += 1
  end
  new_string
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')

separator()

prompt("Exercise 6")
=begin
Input: a string
Output: a new string that alternates between upcase and lowercase letters.  Non alphabetic characters should not count when
        determing if a character should be upcase and lowercase.
Logical Ops
1) Create an empty string
2) Create a boolean variable initialized to true to track whether to upcase or lowercase a letter
3) Initiate a loop that goes through each character of the inputted string
  a) if bool variable is true, upcase the character - change bool to false
  b) if bool variable is false, downcase the character - change bool to true
  c) if char is not an alphabet character leave bool unchanged
4) Return string
=end

def staggered_case2(string)
  result_string = ""
  upcase_char = true
  string.each_char do |char|
    if ALPHA1.include?(char) == false && ALPHA2.include?(char) == false
      result_string += char
    elsif upcase_char
      result_string += char.upcase
      upcase_char = false
    else
      result_string += char.downcase
      upcase_char = true
    end
  end
  result_string
end

p staggered_case2('I Love Launch School!')
p staggered_case2('ALL CAPS')
p staggered_case2('ignore 77 the 444 numbers')

separator()

prompt("Exercise 7")
=begin
Input: an array of integers
Output: a float that represents all of the array's elements multiplied together, divided by the number of elements it possesses rounded to 3 digits
Logical Ops
1) Create variable to store multiplicative total, initialize to 1, convert to float
2) Iterate through the array multiplying the above variable by each element
3) Divide the total by the size of the array
4) Round the quotient to 3 decimal spots
5) Return value
=end

def show_multiplicative_average(array_of_nums)
  total = 1.to_f
  array_of_nums.each {|num| total *= num}
  average = (total / array_of_nums.size)
  format("%.3f", average)
end

p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])

separator()

prompt("Exercise 8")
=begin
Input: two arrays each containing a list of numbers
Output: a new array containing the product of each pair of numbers from the arguments that have the same index
Logical Ops
1) Create new array
2) Iterate through one of the input arrays with index
  a) use the index value to access second inputed array
  b) multiply both values and add result to new array
3) Return resulting array
=end

def multiply_list(array1, array2)
  result_array = []
  array1.each_with_index {|num, index| result_array << num * array2[index]}
  result_array
end

p multiply_list([3, 5, 7], [9, 10, 11])

separator()

prompt("Exercise 9")
=begin
Input: two arrays containing numbers
Output: a new array containing the product of every pair of numbers that can be formed between the inputted arrays
Logical Ops
1) Creat new array
2) Initiate first loop iterating through first array
  a) Initiate second loop iterating through second array
    - Multiply the currently referenced element of the first array with the currently referenced element of the second array
    - Add the result to the new array
3) Return the resulting array after sorting its contents
=end

def multiply_all_pairs(array1, array2)
  resulting_array = []
  array1.each do |num1|
    array2.each do |num2|
      resulting_array << num1 * num2
    end
  end
  resulting_array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])

separator()

prompt("Exercise 10")
=begin
Input: String
Output: the next to last word within the inputted string
Logical Ops
1) Split the string to get an array of all words
2) Return the second to last element of that array
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word')
p penultimate('Launch School is great!')

separator()

prompt("Exercise 11")
=begin
Input: an array
Output: a list of each element and how many times they occurred in the inputted array
Logical Ops
1) Create a hash with default value set to 0
2) Iterate through the array
  a) Assign each element of the array as a key in the hash
  b) Increment the default value by 1
3) Return the hash
=end

def count_occurrences(array)
  result = Hash.new(0)
  array.each {|element| result[element] += 1}
  result
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)
