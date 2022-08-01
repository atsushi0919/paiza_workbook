# 10 個の整数の半角スペース区切りの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_step4

# 入出力例
INPUT1 = <<~"EOS"
  10 9 8 7 6 5 4 3 2 1
EOS
OUTPUT1 = <<~"EOS"
  10
  9
  8
  7
  6
  5
  4
  3
  2
  1
EOS

# 解答例
# 入力
ary = gets.split.map(&:to_i)
# 出力
puts ary
