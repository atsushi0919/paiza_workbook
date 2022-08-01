m = gets.to_i

res = if [3, 4, 5].include?(m)
    "spring"
  elsif [6, 7, 8].include?(m)
    "summer"
  elsif [9, 10, 11].include?(m)
    "autumn"
  else
    "winter"
  end
puts res
