puts "Напишите основание треугольника:"
a = gets.chomp.to_f
puts "Напишите высоту треугольника:"
h = gets.chomp.to_f

s = (a*h) / 2
puts "#{"Площадь треугольника равна"}: #{s.to_f.round(2)}"