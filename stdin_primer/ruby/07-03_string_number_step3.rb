# 1 行目で与えられる N 個の文字列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_step3

# 入出力例
INPUT1 = <<~"EOS"
  5 paiza 813 paiza813 Hello World!
EOS
OUTPUT1 = <<~"EOS"
  paiza
  813
  paiza813
  Hello
  World!
EOS

# 解答例1
# 入力
_, *ary = gets.split
# 出力
puts(ary)

# 解答例2
# 入力
ary = gets.split
n = ary.shift.to_i
# 出力
puts(ary)
