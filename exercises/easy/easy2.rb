def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
age = rand(20..100)
puts "Teddy is #{age} years old!"

separator()

prompt("Exercise 2")
CONVERSION = 10.7639

puts "What is the length of the room?"
length = gets.chomp.to_f
puts "What is the width of the room?"
width = gets.chomp.to_f

area_in_feet = (length * CONVERSION) * (width * CONVERSION)
area_in_meters = length * width

puts "The area in square meters is #{area_in_meters}"
puts "The area in square feet is #{area_in_feet}"

separator()

prompt("Exercise 3")
puts "What is the bill amount?"
bill = gets.chomp.to_f
puts "What is the tip rate?"
tip_rate = gets.chomp.to_f / 100

tip = bill * tip_rate
final_bill = bill + tip

puts "The tip is #{tip}"
puts "The final total is #{final_bill}"

separator()

prompt("Exercise 4")
YEAR = Time.now.year
puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

time_left = retirement_age - age
year_of_retirement = YEAR + time_left

puts "It's #{YEAR}.  You will retire in #{year_of_retirement}"
puts "You only have #{time_left} years left!"

separator()

prompt("Exercise 5")
puts "What is your name?"
name = gets.chomp
puts name[-1] == "!" ? "HELLO #{name.upcase}. WHY ARE WE SCREAMING!?" : "Hello #{name}"

separator()

prompt("Exercise 6")
(1..99).each {|n| puts n if n.odd?}

separator()

prompt("Exercise 7")
(1..99).each {|n| puts n if n.even?}

separator()

prompt("Exercise 8")
puts "Please enter an integer greater than 0"
integer = gets.chomp
puts "Enter 's' to compute the sum, 'p' to compute the product"
pattern = gets.chomp

if pattern == "s"
  total = 0
  (1..integer.to_i).each {|n| total += n}
elsif
  total = 1
  (1..integer.to_i).each {|n| total *= n}
else
  puts "You need to input either 's' or 'p'"
end

puts total

separator()

prompt("Exercise 9")

puts "This was just a mental exercise on reassignment"

separator()

prompt("Exercise 10")
def negative(integer)
  integer > 0 ? -integer : integer
end

puts negative(10)
puts negative(-5)
puts negative(0)
