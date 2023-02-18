def separator
  puts "----------"
end

def prompt(string)
  puts ">> #{string}"
end

prompt("Exercise 1")
def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

puts short_long_short("hello", "matt")
puts short_long_short("abc", "world")

separator()

prompt("Exercise 2")
def century(year)
  century = (year % 100 == 0) ? year / 100 : (year / 100) + 1
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return "th" if [11, 12, 13].include?(century % 100)

  last_digit = century % 10

  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

puts century(1098)
puts century(1612)
puts century(2023)

separator()

prompt("Exercise 3")
def leap_year?(year)
  if year % 100 == 0
    return true if year % 400 == 0
    false
  else
    return true if year % 4 == 0
    false
  end
end

puts leap_year?(2016)
puts leap_year?(2400)
puts leap_year?(1700)

separator()

prompt("Exercise 4")
def new_leap_year?(year)
  if year < 1752
    return true if year % 4 == 0
    false
  else
    if year % 100 == 0
      return true if year % 400 == 0
      false
    else
      return true if year % 4 == 0
      false
    end
  end
end

puts new_leap_year?(2016)
puts new_leap_year?(2400)
puts new_leap_year?(1700)

separator()

prompt("Exercise 5")
def multiple_check(integer)
  integer % 3 == 0 || integer % 5 == 0
end

def multisum(integer)
  total = 0
  (1..integer).each {|x| total += x if multiple_check(x)}
  total
end

puts multisum(20)
puts multisum(12)

separator()

prompt("Exercise 6")
def running_total(array)
  total = 0
  array.map {|element| total += element}
end

p running_total([2,5,13])
p running_total([14,11,7,15,20])

separator()

prompt("Exercise 7")
INTEGER_CONVERSION = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0}

def string_to_integer(string)
  numbers = string.chars.map {|x| INTEGER_CONVERSION[x]}
  result = 0
  numbers.each {|y| result = 10 * result + y}
  result
end

puts string_to_integer("4321")
puts string_to_integer("570")

separator()

prompt("Exercise 8")
def string_to_integer2(string)
  case string[0]
  when "+" then string_to_integer(string[1..-1])
  when "-" then -string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

puts string_to_integer2("4321")
puts string_to_integer2("-570")
puts string_to_integer2("+100")

separator()

prompt("Exercise 9")
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321)
p integer_to_string(123)

separator()

prompt("Exercise 10")
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)
