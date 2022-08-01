# 数値を M けた半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step4

# 入出力例
INPUT1 = <<~"EOS"
  813 4
EOS
OUTPUT1 = <<~"EOS"
  _813
EOS

INPUT2 = <<~"EOS"
  813 8
EOS
OUTPUT2 = <<~"EOS"
  _____813
EOS

# 解答例1
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts("%#{m}d" % n)

# 解答例2
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts("%*d" % [m, n])

# 解答例3
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts(sprintf("%*d", m, n))

# 解答例4
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts(format("%*d", m, n))

# 解答例5
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts(n.to_s.rjust(m, " "))
