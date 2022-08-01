# 5 つの整数の半角スペース区切りの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_step3

# 入出力例
INPUT1 = <<~"EOS"
  2 0 8 1 3
EOS
OUTPUT1 = <<~"EOS"
  2
  0
  8
  1
  3
EOS

INPUT2 = <<~"EOS"
  1234 5678 9101 1121 3141
EOS
OUTPUT2 = <<~"EOS"
  1234
  5678
  9101
  1121
  3141
EOS

# 解答例
# 入力
ary = gets.split.map(&:to_i)
# 出力
puts(ary)
