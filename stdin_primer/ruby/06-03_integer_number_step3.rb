# 1 行目で与えられる N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step3

# 入出力例
INPUT1 = <<~"EOS"
  13 5085 2923 8669 3231 7032 73 2683 8317 5545 9774 7179 2646 2470
EOS
OUTPUT1 = <<~"EOS"
  5085
  2923
  8669
  3231
  7032
  73
  2683
  8317
  5545
  9774
  7179
  2646
  2470
EOS

# 解答例1
# 入力
n, *ary = gets.split.map(&:to_i)
# 出力
puts(ary)

# 解答例2
# 入力
tmp = gets.split.map(&:to_i)
n = tmp[0]
ary = tmp[1..]
# 出力
puts(ary)
