# 3 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step3

# 入出力例
INPUT1 = <<~"EOS"
  abc
  def
  ghi
EOS
OUTPUT1 = <<~"EOS"
  abc
  def
  ghi
EOS

INPUT2 = <<~"EOS"
  line_1
  line_2
  line_3
EOS
OUTPUT2 = <<~"EOS"
  line_1
  line_2
  line_3
EOS

INPUT3 = <<~"EOS"
  Haveagood
  C++
  life!
EOS
OUTPUT3 = <<~"EOS"
  Haveagood
  C++
  life!
EOS

# 解答例1
# 入力
s = gets.chomp
t = gets.chomp
u = gets.chomp
# 出力
puts(s)
ptus(t)
ptus(u)

# 解答例2
# 入力
s = gets
t = gets
u = gets
# 出力
puts(s)
ptus(t)
ptus(u)
