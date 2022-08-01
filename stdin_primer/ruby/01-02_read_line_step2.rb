# 2 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step2

# 入出力例
INPUT1 = <<~"EOS"
  paiza
  gino
EOS
OUTPUT1 = <<~"EOS"
  paiza
  gino
EOS

INPUT2 = <<~"EOS"
  heisei31
  reiwa1
EOS
OUTPUT2 = <<~"EOS"
  heisei31
  reiwa1
EOS

INPUT3 = <<~"EOS"
  2012021300
  2020042218
EOS
OUTPUT3 = <<~"EOS"
  2012021300
  2020042218
EOS

# 解答例1
# 入力
s = gets.chomp
t = gets.chomp
# 出力
puts(s)
ptus(t)

# 解答例2
# 入力
s = gets
t = gets
# 出力
puts(s)
ptus(t)
