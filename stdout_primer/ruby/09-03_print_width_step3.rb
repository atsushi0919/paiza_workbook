# 複数の数値を半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step3

# 入出力例
INPUT1 = <<~"EOS"
  12
  0
  8
  81
  813
  0
  0
  0
  0
  0
  0
  0
  0
EOS
OUTPUT1 = <<~"EOS"
  __0
  __8
  _81
  813
  __0
  __0
  __0
  __0
  __0
  __0
  __0
  __0
EOS

# 解答例1
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |m| puts("%3d" % m) }

# 解答例2
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |m| puts(sprintf("%3d", m)) }

# 解答例3
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |m| puts(format("%3d", m)) }

# 解答例4
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |m| puts(m.to_s.rjust(3, " ")) }
