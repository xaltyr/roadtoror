puts "Введите число: "
day = gets.to_i

puts "Введите число месяца: " 
month = gets.to_i

puts "Введите год: "
year = gets.to_i

days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]


if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
  days_in_month[1] = 29
end

number = day
(0...month-1).each do |i|
  number += days_in_month[i]
end

puts "#{number} день с начала года"
