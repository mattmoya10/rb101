def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")

def number_printer(string, integer)
  if integer > 0
    integer.times {|x| puts string }
  else
    puts "Sorry, you need a positive integer"
  end
end

number_printer("Matt", 5)
number_printer("Matt", -1)

separator()

prompt("Exercise 2")
def integer_check(integer)
  return true if integer.abs % 2 != 0
  false
end

puts integer_check(7)
puts integer_check(-5)
puts integer_check(0)

separator()

prompt("Exercise 3")
def stringy(integer)
  if integer > 0
    binary = "1"
    index = 1
    while index < integer
      index.even? ? binary << "1" : binary << "0"
      index += 1
    end
    binary
  else
    puts "You need a positive integer"
  end
end

puts stringy(6)
puts stringy(10)
puts stringy(-5)

separator()

prompt("Exercise 4")
def calculate_bonus(integer, boolean)
  boolean ? integer / 2 : 0
end

puts calculate_bonus(10_000, true)
puts calculate_bonus(10_000, false)

separator()

prompt("Exercise 5")
def print_in_box(string)
  horizontal_lines = "+ #{"-" * string.size} +"
  empty_lines = "| #{' ' * string.size} |"

  puts horizontal_lines
  puts empty_lines
  puts "| #{string} |"
  puts empty_lines
  puts horizontal_lines
end

print_in_box("Hello World")

separator()

prompt("Exercise 6")
def triangle(integer)
  array = []
  integer.times {|index| array.push(" ")}
  integer.times do |index|
    array[-(index + 1)] = "*"
    puts array.join
  end
end

triangle(10)

separator()

prompt("Exercise 7")
puts "Welcome to the MadLibs Game!"
puts "Enter a noun:"
noun = gets.chomp
puts "Enter a verb:"
verb = gets.chomp
puts "Enter an adverb:"
adverb = gets.chomp
puts "Enter an adjective:"
adjective = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?  That's hilarious!"

separator()

prompt("Exercise 8")
def reversed_number(integer)
  integer.to_s.reverse.to_i
end

puts reversed_number(12_345)
puts reversed_number(693_321)

separator()

prompt("Exercise 9")
def center_of(string)
  size = string.size
  if size.odd?
    string[size / 2]
  else
    string[((size / 2)-1)..(size / 2)]
  end
end

puts center_of("Matt")
puts center_of("dog")
