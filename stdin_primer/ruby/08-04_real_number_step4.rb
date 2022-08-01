# 2 行目で与えられる N 個の実数の入力 (large) (paizaランク D 相当)2 行目で与えられる N 個の実数の入力 (large) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_step4

# 入出力例
INPUT1 = <<~"EOS"
  5
  0.813 8.13 8 1.83 3.81
EOS
OUTPUT1 = <<~"EOS"
  0.813
  8.13
  8
  1.83
  3.81
EOS

# 解答例
# 1 行目入力
n = gets.to_i
# 2 行目入力
ary = gets.split.map(&:to_f)
# 出力
puts(ary)
