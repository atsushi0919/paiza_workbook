h = gets.chomp

res = if h == "R"
    "P"
  elsif h == "P"
    "S"
  else
    "R"
  end
puts res
