# 最も大きな最大公約数 (paizaランク C 相当)

INPUT1 = <<~"EOS"
  6
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  17
EOS
OUTPUT2 = <<~"EOS"
  8
EOS

n = gets.to_i

max_gcd = -1
(1..n).to_a.combination(2).each do |a, b|
  max_gcd = [max_gcd, a.gcd(b)].max
end

puts max_gcd
