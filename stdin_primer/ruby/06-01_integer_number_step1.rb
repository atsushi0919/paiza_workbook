# 改行区切りでの N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step1

# 入出力例
INPUT1 = <<~"EOS"
  20
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
  19
  20
EOS
OUTPUT1 = <<~"EOS"
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
  19
  20
EOS

# 解答例
# 1 行目の入力
n = gets.to_i
# 続く n 行の入力
ary = n.times.map { gets.to_i }
# 出力
puts(ary)
