n = gets.to_i

res = 0
[500, 100, 50, 10, 5, 1].each do |coin|
  res += n / coin
  n %= coin
end
puts res
