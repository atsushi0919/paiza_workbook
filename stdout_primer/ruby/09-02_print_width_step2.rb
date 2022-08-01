# 数値をゼロ埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step2

# 入出力例
INPUT1 = <<~"EOS"
  12
EOS
OUTPUT1 = <<~"EOS"
  012
EOS

INPUT2 = <<~"EOS"
  0
EOS
OUTPUT2 = <<~"EOS"
  000
EOS

# 解答例1
# 入力
n = gets.to_i
# 出力
puts("%03d" % n)

# 解答例2
# 入力
n = gets.to_i
# 出力
puts(sprintf("%03d", n))

# 解答例3
# 入力
n = gets.to_i
# 出力
puts(format("%03d", n))

# 解答例4
# 入力
n = gets.to_i
# 出力
puts(n.to_s.rjust(3, "0"))
