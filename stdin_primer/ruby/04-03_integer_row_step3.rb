# 5 行の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_row_step3

# 入出力例
INPUT1 = <<~"EOS"
  1
  2
  3
  4
  5
EOS
OUTPUT1 = <<~"EOS"
  1
  2
  3
  4
  5
EOS

INPUT2 = <<~"EOS"
  1111
  3333
  5555
  7777
  9999
EOS
OUTPUT2 = <<~"EOS"
  1111
  3333
  5555
  7777
  9999
EOS

# 解答例1
n = 5
# 入力
ary = n.times.map { gets.to_i }
# 出力
puts(ary)

# 解答例2
n = 5
# 入力
ary = []
n.times do
  ary.push(gets.to_i)
end
# 出力
puts(ary)
