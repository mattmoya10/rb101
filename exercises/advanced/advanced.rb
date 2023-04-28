def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
=begin
Input: a file with text data for a madlibs algorithm
Output: the text of the file filled in with random words as appropriate
List of Problems
1) Need to have a bank of adjectives, nouns, adverbs and verbs for the madlibs
2) Need to be able to read through each line of the file
3) For every instance of keyword, need to be able to produce a random value of that category
Algorithm
1) Create a new file object passing the input file
2) Create constant arrays that contain a fixed set of words for each category
3) Iterate through the line by line using the each method
  - Pass a block that pairs keywords to a sample from the arrays
=end

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg).freeze
VERBS = %w(jumps lifts bites licks).freeze
ADVERBS = %w(easily lazily noisily excitedly).freeze

def madlibs(file)
  text = File.new(file)
  text.each do |line|
    puts format(line, adjective: ADJECTIVES.sample,
                      noun: NOUNS.sample,
                      verb: VERBS.sample,
                      adverb: ADVERBS.sample)
  end
end

p madlibs("sample2.txt")

prompt("Exercise 2")
=begin
Input: an odd integer >= 7
Output: an 8 pointed star within a nxn grind where n is the input
List of Problems
1) Need a strategy for knowing how many stars to put on each line and at what spaces (always 3 stars)
  - Need to have a plan for the spaces in between the stars on each line (spaces in between stars vary depending on distance from center line)
2) Need to change that strategy as you iterate over each line
  - Need to address how the top and bottom parts of the star are mirrored
Algorithm
1) Create a variable for spaces around stars, spaces inside stars, distance from center - these will change line by line
2) Iterate through each line printing in accordance with the rules of each line
=end


def star(odd_num)
  distance = odd_num / 2
  spaces_outside = 0
  spaces_inside = (odd_num - 3) / 2
  for lines in (-distance..distance) do
    if lines == 0
      puts "*" * odd_num
      spaces_outside -= 1
      spaces_inside += 1
    elsif lines < 0
      puts " " * spaces_outside.abs + "*" + " " * spaces_inside.abs + "*" + " " * spaces_inside.abs + "*" + " " * spaces_outside.abs
      spaces_outside += 1
      spaces_inside -= 1
    else
      puts " " * spaces_outside.abs + "*" + " " * spaces_inside.abs + "*" + " " * spaces_inside.abs + "*" + " " * spaces_outside.abs
      spaces_outside -= 1
      spaces_inside += 1
    end
  end
end

star(7)
separator
star(9)

prompt("Exercise 3")
=begin
Input: a 3x3 matrix
Output: the transposition of said matrix
List of Problems
1) Need an effective way to navigate through the input
  - What is the best way to find the values I need for the output?
2) Need a strategy for creating the transposed matrix w/o modifying original matrix
Algorithm
1) Create an empty 3x3 matrix result array
2) Want to iterate over each index of each subarray
  - Create an index variable, set to 0
  - Call .each method on inputted matrix
  - Add the first element of each subarray to the result subarray indexed by the index variable
3) Return the result
=end

def transpose(matrix)
  result = [[],[],[]]
  for index in (0..2) do
    matrix.each {|subarray| result[index] << subarray[index]}
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

prompt("Exercise 4")
=begin
Input: a matrix of any size
Output: a transposition of the input
List of Problems
1) Need to be able to navigate through the inputted matrix
2) Need a way to create the resulting matrix
Algorithm
1) Loop through the index values of the first subarray in the matrix
  - For each of these index values, use the map method to loop through each subarray of the input at that index
  - Add the returned array to the output matrix
=end

def transpose2(matrix)
  result = []
  matrix.first.each_index do |index|
    result << matrix.map {|subarray| subarray[index]}
  end
  result
end

p transpose2([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose2([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose2([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose2([[1]]) == [[1]]

prompt("Exercise 5")
=begin
Input: a matrix
Output: the input rotated 90 degrees clockwise
List of Problems
1) Need a strategy for navigating through the input
  - Still need to work through indices of first element
2) Need a strategy for creating the result matrix
  - Need to create arrays to add to matrix
  - These arrays should find elements from last to first
Algorithm
1) Create result variable referencing an empty array
2) Iterate through each_index of the first element of the inputted matrix
  - Use the map method to iterate over the sub arrays of the inputted matrix
    - The passed block should return the element of the sub array at position -index - 1
    - Add the returned array object from the map method to the result array
=end

def rotate90(matrix)
  result = []
  matrix.first.each_index do |index|
    result << matrix.reverse.map {|subarray| subarray[index]}
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

prompt("Exercise 6")

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# Ruby will look for a conditional if one is not obvious; in this case the map call is the conditional; making it so that there is nothing to execute along that branch

prompt("Exercise 7")
=begin
Input: two sorted arrays of integers
Output: a single new array that has all the integers from both inputted arrays sorted
List of Problems
1) Need a strategy for iterating through both inputs
2) Need a strategy for comparing the values of the elements of both inputs
One method should be sufficient
Need to be able to address input that contains no elements

Algorithm
1) Want to iterate through one of the input arrays
  - each method should be sufficient
2) Want to iterate through the second array
  - while loop plus index tracking
  - conditional should reflect the bounds of the second array
3) Then add the current value to the array
4) Flatten the resulting array
=end

def merge(array1, array2)
  result = []
  index = 0
  return array1 if array2.size == 0
  return array2 if array1.size == 0
  array1.each do |num1|
    while index < array2.size && array2[index] < num1
      result << array2[index]
      index += 1
    end
    result << num1
  end
  result.concat(array2[index..-1])
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

prompt("Exercise 8")
=begin
Input: an array
Output: the array with its elements sorted through merge sort
List of Problems
1) Need to recurisively divide input into subarrays of half size until reach one element subarrays
  - Two subarrays should always been maintained at each level
2) Need to call merge function from previous exercise on two subarrays that result from step one
Algorithm
1) Base case is one element array
2) Create two subarrays based on the input
3) Reassign the variables of these subarrays with a recursive call to the method
4) Call the merge method with the subarrays after recursive loop is complete
=end

def merge_sort(array)
  return array if array.size == 1
  subarray1 = array[0...array.size / 2]
  subarray2 = array[array.size / 2...array.size]
  subarray1 = merge_sort(subarray1)
  subarray2 = merge_sort(subarray2)
  p merge(subarray1, subarray2)
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

prompt("Exercise 9")
=begin
Input: a rational number
Output: an array of denominators of some number of fractions that when totaled equal the input
Constraints: denominators must be unique in the output
List of Problems
1) How to represent the input and output given rational numbers - be wary of float number issues
2) Strategy for dividing the input into rational numbers with unique denominators
3) How to generate the output
Algorithm
1) Empty array for output
2) Use Rational class to represent numbers
3) Iterate through possible denominators decreasing that value from the input adding them to result until 0
=end

def egyptian(num)
  result = []
  denom = 1
  while num != 0
    if Rational(1, denom) <= num
      num -= Rational(1, denom)
      result << denom
    end
    denom += 1
  end
  result
end

def unegyptian(denoms)
  denoms.reduce(Rational(0)) do |total, denom|
    total + Rational(1, denom)
  end
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)