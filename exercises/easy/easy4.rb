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
