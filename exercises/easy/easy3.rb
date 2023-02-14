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
