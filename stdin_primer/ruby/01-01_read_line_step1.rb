# 1 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step1

# 入出力例
INPUT1 = <<~"EOS"
  paiza
EOS
OUTPUT1 = <<~"EOS"
  paiza
EOS

INPUT2 = <<~"EOS"
  Paiza21
EOS
OUTPUT2 = <<~"EOS"
  Paiza21
EOS

INPUT3 = <<~"EOS"
  paiza813
EOS
OUTPUT3 = <<~"EOS"
  paiza813
EOS

# 解答例1
# 入力
s = gets.chomp
# 出力
puts(s)

# 解答例2
# 入力
s = gets
# 出力
puts(s)
