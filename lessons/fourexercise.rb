puts "Введите переменную a"
a = gets.chomp.to_i

puts "Введите переменную b"
b = gets.chomp.to_i

puts "Введите переменную c"
c = gets.chomp.to_i

d = b**2 - (4 * a * c)

puts "#{"D ="} #{d.to_f}" 

if d > 0 
	xone = (-b + Math.sqrt(d)) / (2 * a)
	xtwo = (-b - Math.sqrt(d)) / (2 * a)
  
  puts "x1 = #{xone.to_f.round(2)} x2 = #{xtwo.to_f.round(2)}"

elsif  d == 0
    xone = -b / 2 * a
   
   puts "x = #{xone.to_f.round(2)}"

else
	puts "Корней нет"
end