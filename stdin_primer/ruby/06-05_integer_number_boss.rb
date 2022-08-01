# 【N 個の整数の入力】1 行目で与えられる N 個の整数の入力 (large) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_boss

# 入出力例
INPUT1 = <<~"EOS"
  5 8 1 3 1 3
EOS
OUTPUT1 = <<~"EOS"
  8
  1
  3
  1
  3
EOS

# 解答例
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
