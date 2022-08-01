# 半角スペース区切りの 10 個の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step4

# 入出力例
INPUT1 = <<~"EOS"
  VypymzW25l 3xsXWAK NYwbs2MRC kh4 mr38o8W9 94 fEJ 6THlW fJFTy n
EOS
OUTPUT1 = <<~"EOS"
  VypymzW25l
  3xsXWAK
  NYwbs2MRC
  kh4
  mr38o8W9
  94
  fEJ
  6THlW
  fJFTy
  n
EOS

INPUT2 = <<~"EOS"
  VDHUoNUym oqnbK7XsHK GPuafB yWdzgE bUMaMdBV 3kDU9 AbWnot 1E44Ekwz jdu Y0e
EOS
OUTPUT2 = <<~"EOS"
  VDHUoNUym
  oqnbK7XsHK
  GPuafB
  yWdzgE
  bUMaMdBV
  3kDU9
  AbWnot
  1E44Ekwz
  jdu
  Y0e
EOS

INPUT3 = <<~"EOS"
  F5G6 0KSYzlF ghYYhAw NHCSxgPMbE EYqKRElk 8UYzUH 6mxtW 0tt1n 2cEaAQs gAWn
EOS
OUTPUT3 = <<~"EOS"
  F5G6
  0KSYzlF
  ghYYhAw
  NHCSxgPMbE
  EYqKRElk
  8UYzUH
  6mxtW
  0tt1n
  2cEaAQs
  gAWn
EOS

# 解答例1
# 入力
ary = gets.chomp.split(" ")
# 出力
puts(ary)

# 解答例2
# 入力
s1, s2, s3, s4, s5, s6, s7, s8, s9, s10 = gets.chomp.split(" ")
# 出力
puts(s1)
puts(s2)
puts(s3)
puts(s4)
puts(s5)
puts(s6)
puts(s7)
puts(s8)
puts(s9)
puts(s10)
