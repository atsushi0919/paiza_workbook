# 3 割打者 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_hitter

INPUT1 = <<"EOS"
10 3
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# 解答例1-1
n, m = gets.split.map(&:to_i)

if m / n.to_f >= 0.3
  puts "Yes"
else
  puts "No"
end

# 解答例1-2
n, m = gets.split.map(&:to_f)

puts m / n >= 0.3 ? "Yes" : "No"
