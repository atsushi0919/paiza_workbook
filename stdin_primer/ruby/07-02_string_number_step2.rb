# 2 行目で与えられる N 個の文字列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_step2

# 入出力例
INPUT1 = <<~"EOS"
  5
  paiza 813 paiza813 hello813 good
EOS
OUTPUT1 = <<~"EOS"
  paiza
  813
  paiza813
  hello813
  good
EOS

# 解答例
# 1 行目入力
n = gets.to_i
# 2 行目入力
ary = gets.split
# 出力
puts(ary)
