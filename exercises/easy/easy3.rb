def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
def gather_input(array)
  puts "Enter a number:"
  number = gets.chomp.to_i
  array.push(number)
  array
end

input_array = []
6.times {|x| gather_input(input_array)}
final_num = input_array.pop
if input_array.include?(final_num)
  puts "The number #{final_num} appears in #{input_array}"
else
  puts "The number #{final_num} does not appear in #{input_array}"
end

separator()

prompt("Exercise 2")
puts "Enter the first number:"
num1 = gets.chomp
puts "Enter the second number:"
num2 = gets.chomp

puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
puts "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
puts "#{num1} / #{num2} = #{num1.to_f / num2.to_f}"
puts "#{num1} ** #{num2} = #{num1.to_i ** num2.to_i}"

separator()

prompt("Exercise 3")
puts "Please write a word or multiple words:"
string = gets.chomp

puts "There are #{string.delete(' ').size} characters in '#{string}'"

separator()

prompt("Exercise 4")
def multiply(num1, num2)
  num1 * num2
end

puts multiply(10,6)
puts multiply(12,3)

separator()

prompt("Exercise 5")
def square(integer)
  multiply(integer, integer)
end

puts square(5)
puts square(-8)

separator()

prompt("Exercise 6")
def xor?(bool1, bool2)
  return true if bool1 && !bool2
  return true if !bool1 && bool2
  false
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.even?)

separator()

prompt("Exercise 7")
def palindrome?(string)
  string == string.reverse
end

puts palindrome?("madam i'm adam")
puts palindrome?("Madam")
puts palindrome?("madam")

separator()

prompt("Exercise 8")
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

puts real_palindrome?("madam i'm adam")
puts real_palindrome?("Madam")
puts real_palindrome?("madam")

separator()

prompt("Exercise 9")
def palindromic_number?(integer)
  integer.to_s == integer.to_s.reverse
end

puts palindromic_number?(34543)
puts palindromic_number?(12345)

separator()

prompt("Exercise 10")
def uppercase?(string)
  string == string.upcase
end

puts uppercase?('t')
puts uppercase?('T')
puts uppercase?('Four Score')
puts uppercase?('FOUR SCORE')
