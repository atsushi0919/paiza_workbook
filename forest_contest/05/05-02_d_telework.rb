# テレワーク可能か (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_telework

INPUT1 = <<"EOS"
60 sunny
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# 解答例1-1
a, b = gets.split
a = a.to_i

if a > 30 || b == "rainy"
  puts "Yes"
else
  puts "No"
end


# 解答例1-2
a, b = gets.split

puts a.to_i > 30 || b == "rainy" ? "Yes" : "No"
