n = 1
arr = [0,1]
while n<100
	arr << arr[n] + arr[n-1]
	n += 1
end
puts arr