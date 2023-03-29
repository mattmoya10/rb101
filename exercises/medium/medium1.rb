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

