# 改行区切りでの N 個の実数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_step1

# 入出力例
INPUT1 = <<~"EOS"
  5
  0.813
  8.13
  81.3
  813
  8138
EOS
OUTPUT1 = <<~"EOS"
  0.813
  8.13
  81.3
  813
  8138
EOS

# 解答例
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.to_f }
# 出力
puts(ary)
