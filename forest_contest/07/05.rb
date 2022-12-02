# ブロックの埋め込み (paizaランク C 相当)

INPUT1 = <<~"EOS"
  4 6
EOS
OUTPUT1 = <<~"EOS"
  12
EOS

INPUT2 = <<~"EOS"
  3 3
EOS
OUTPUT2 = <<~"EOS"
  4
EOS

n, m = gets.split.map(&:to_i)

puts n * m / 2
