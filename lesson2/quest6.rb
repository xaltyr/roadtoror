product_list = {}
total = {}
total_sum = {}
loop do 
puts "Введите название товара"
  product = gets.chomp
    if product == "стоп"
    	break    	
    end
      puts "Введите количество товара"
  amount = gets.chomp.to_f.round(2)
  puts "Введите цену за единицу"
  price = gets.chomp.to_f.round(2)
  sum = amount * price
  total[price.to_f] = amount.to_f 
  product_list[product] = total
  total = {}
  total_sum[product] = sum.round(2)
  end
result = total_sum.reduce(0) { |val, (name, total)| val + total}
puts "Ваш список товаров: #{product_list} 
Сумма каждой позиции: #{total_sum}
Итог:#{result.round(2)}"
 
