puts "Здравствуйте, как вас зовут?"
name = gets.chomp

puts "Какой у вас рост?"
height = gets.chomp.to_i

weight = ((height - 110) * 1.15).to_i

if weight >= 0
  puts "#{"Ваш идеальный вес"} #{name.capitalize}: #{weight.to_s}#{"кг"}"
else
  puts "Ваш вес уже оптимальный."
end
