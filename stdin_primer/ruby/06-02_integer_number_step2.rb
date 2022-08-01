# 2 行目で与えられる N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step2

# 入出力例
INPUT1 = <<~"EOS"
  6
  6561 3785 6338 9568 4956 557
EOS
OUTPUT1 = <<~"EOS"
  6561
  3785
  6338
  9568
  4956
  557
EOS

# 解答例
# 1 行目の入力
n = gets.to_i
# 2 行目の入力
ary = gets.split.map(&:to_i)
# 出力
puts(ary)
