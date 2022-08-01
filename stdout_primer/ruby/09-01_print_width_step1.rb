# 数値を半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step1

# 入出力例
INPUT1 = <<~"EOS"
  12
EOS
OUTPUT1 = <<~"EOS"
  12
EOS

INPUT2 = <<~"EOS"
  0
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

# 解答例1
# 入力
n = gets.to_i
# 出力
puts("%3d" % n)

# 解答例2
# 入力
n = gets.to_i
# 出力
puts(sprintf("%3d", n))

# 解答例3
# 入力
n = gets.to_i
# 出力
puts(format("%3d", n))

# 解答例4
# 入力
n = gets.to_i
# 出力
puts(n.to_s.rjust(3, " "))

# 解答例5
# 入力
n = gets.to_i
# 3 桁になるようにスペースで埋める
s = " " * (3 - n.to_s.length) << n.to_s
# 出力
puts(s)
