def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: a floating point number representing an angle between 0 and 360
Output: a string that reprsents the input in degrees, minutes and seconds format
Logical Operations
1) Will look to build the string after breaking down and converting - initialize default position
2) Convert the input into its equivalent with respect to the most fundamental unit - seconds
3) Use division and remainders to break down the number of degrees, minutes and remaining seconds from that point
=end

DEGREE = "\xC2\xB0"
MINUTES_IN_DEGREES = 60
SECONDS_IN_MINUTE = 60
SECONDS_IN_DEGREE = MINUTES_IN_DEGREES * SECONDS_IN_MINUTE

def dms(float)
  total_seconds = (float * SECONDS_IN_DEGREE).round(2)
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_IN_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_IN_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)

separator()

prompt("Exercise 2")
=begin
Input = an array of strings
Output = array of identical string values except with all vowels removed
Logical Ops
1) Iterate through the input using a method that returns an array
2) Delete the vowels
3) Return the mutated array
=end

def remove_vowels(array_of_strings)
  array_of_strings.map {|string| string.delete("aeiouAEIOU")}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ))

separator()

prompt("Exercise 3")
=begin
Input: an integer respresenting the desired number of digits for a number within the fibonacci sequence
Output: an integer representing the index of the the first fibonacci number that has the input digits
Logical Ops
1) Create the fibonacci sequence with a loop that exits as soon as desired output is found
      will need to have variables for index and two numbers to be added together to generate sequence
=end

def find_fibonacci_index_by_length(digits)
  first = 1
  second = 1
  index = 2 #reflects true starting point of fibonacci sequence

  loop do
    index += 1
    sum = first + second
    break if sum.to_s.size == digits
    first = second
    second = sum
  end
  index
end

p find_fibonacci_index_by_length(2)
p find_fibonacci_index_by_length(3)
p find_fibonacci_index_by_length(10)
p find_fibonacci_index_by_length(100)
p find_fibonacci_index_by_length(1000)

separator()

prompt("Exercise 4")
=begin
Input: an array
Output: reverses the elements of the input in place - mutate the passed array
Logical Ops
1) create two variables to refer to index locations that will be swapped
2) create a while loop
    a) break out of the loop when the index location reaches middle of array
    b) swap the elements of the array
    c) increment and decrement index variables
=end

def reverse!(array)
  index1 = 0
  index2 = -1
  while index1 < array.size / 2
    array[index1], array[index2] = array[index2], array[index1]
    index1 += 1
    index2 -= 1
  end
  array
end

p reverse!([1,2,3,4])
p reverse!(["c", "d", "e", "b", "a"])

separator()

prompt("Exercise 5")
=begin
Input: an array
Output: a new array with the elements of the original list in reverse order. Do not modify original array
Logical Ops
1) Create a new array
2) Iterate on the inputted array backwards until abs value of index is less than size of the array
3) Add each element to the new array
=end

def reverse(array)
  output = []
  index = -1
  while index.abs <= array.size
    output << array[index]
    index -= 1
  end
  output
end

p reverse([1,2,3,4])
p reverse(%w(a b e d c))
p reverse(["abc"])

separator()

prompt("Exercise 6")
=begin
Input: two arrays
Output: an array that contains all the values of the input arrays with no duplicates
=end

def merge(array1, array2)
  output_array = []
  output_array << array1
  output_array << array2
  output_array.flatten.uniq
end

p merge([1,3,5], [3,6,9])

separator()

prompt("Exercise 7")
=begin
Input: an array
Output: two arrays as a pair of nested arrays that contain the first half and secondhalf of the inputted array respectively
Logical Ops
1) Create an empty array containing two arrays representing the final result
2) Create a variable to represent half the length of the array - this will be used to determine which elements get sorted into either of the nested arrays
3) Iterate through each element of the inputted array
    a) Check if the index of each element is either less than or equal to or greater than the variable created in step 2
    b) If less than or equal to that variable, push the element into the first array indexed within the array created in step 1
    c) If greater than to that variable, push the element into the second array indexed within the array created in step 1
4) Return the completed nested array
=end

def halvsies(array)
  final_array = [[],[]]
  half_point = (array.size / 2.0).ceil
  array.each do |element|
    if array.index(element) <= half_point
      final_array[0] << element
    else
      final_array[1] << element
    end
  end
  final_array
end

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])

separator()

prompt("Exercise 8")
=begin
Input: an array
Output: the only element within the array that has a duplicate value known to be in the array
Logical Ops
1) Create a variable that will be assigned to contain a single element within the inputted array
2) Create two counter variables that will be assigned to zero to represent the index of the array currently being evaluated
3) Create a while loop that will go through each element of the inputted array
    a) Assign the variable created to the element in the first index of the array
    b) Create a while loop that will search through the entire array for duplicates of the stored element
        - Go next iteration if the index of the stored element is the same as the index of the element currently being evaluated in this loop
        - if you find a duplicate return the element
        - increment the counter variable
    c) increment the counter variable
=end

def find_dup(array)
  counter1 = 0
  while counter1 < array.size
    element = array[counter1]
    counter2 = 0
    while counter2 < array.size
      if counter1 == counter2
        counter2 += 1
        next
      end
      break if element == array[counter2]
      counter2 += 1
    end
    break if element == array[counter2]
    counter1 += 1
  end
  element
end

p find_dup([1, 5, 3, 1])
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58])

separator()

prompt("Exercise 9")
=begin
Input: an array and a search value
Output: a boolean that reflects whether or not the inputted search value exists within the inputted array
Logical Ops
1) Create a variable that will contain the boolean result of the search loop, initialize it to false
2) Create a counter variable for the search loop
3) Use a while loop to iterate over the array
4) Access the elements of the array using the counter value as an index, compare it to the provided search value
5) Change variable created in step 1 to true if the value matches any of the elements in the array
6) Return the boolean result variable
=end

def include?(array, search_value)
  result = false
  counter = 0
  while counter < array.size
    result = true if array[counter] == search_value
    break if result == true
    counter += 1
  end
  result
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)

separator()

prompt("Exercise 10")
puts "Will output a list of the elements with the appropriate ones capitalized due to the each method
      passing a bunch of direct references to the second array.  They will be mutated by the upcase!
      method as a result."