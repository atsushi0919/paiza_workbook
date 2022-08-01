# 改行区切りでの N 個の文字列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_step1

# 入出力例
INPUT1 = <<~"EOS"
  5
  hello
  paiza
  813
  paiza2020
  Nice
EOS
OUTPUT1 = <<~"EOS"
  hello
  paiza
  813
  paiza2020
  Nice
EOS

# 解答例
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.chomp }
# 出力
puts(ary)
