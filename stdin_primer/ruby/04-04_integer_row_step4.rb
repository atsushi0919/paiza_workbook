# 100 行の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_row_step4

# 入出力例
INPUT1 = <<~"EOS"
  4090
  4199
  .
  省略
  .
  9976
  4574
EOS
OUTPUT1 = <<~"EOS"
  4090
  4199
  .
  省略
  .
  9976
  4574
EOS

# 解答例1
n = 100
# 入力
ary = n.times.map { gets.to_i }
# 出力
puts(ary)

# 解答例2
n = 100
# 入力
ary = []
n.times do
  ary.push(gets.to_i)
end
# 出力
puts(ary)
