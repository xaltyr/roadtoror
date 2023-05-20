puts "Запишите первую сторону треугольника:"
a = gets.chomp.to_f

puts "Запишите вторую сторону треугольника:"
b = gets.chomp.to_f

puts "Запишите третью сторону треугольника:"
c = gets.chomp.to_f

formone = (a**2 + b**2)
formtwo = (b**2 + c**2)
formthree = (a**2 + c**2)


if  (a > b && a > c && a**2 == formtwo) || 
	(b > a && b > c && b**2 == formthree) || 
	(c > a && c > b && c**2 == formone)

    puts "Треугольник прямоугольный"
elsif ((a == b) && (c != b) && (c != a)) || 
  	  ((b == c) && (a != c) && (a != b)) || 
  	  ((a == c) && (a != b) && (b != c))

	puts "Треугольник равнобедренный"
  
elsif (a == b) && (b == c)	
	puts "Треугольник равносторонний"
  
else
	puts "Треугольник разносторонний"
end
  


