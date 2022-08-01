# 【出力幅を指定して出力】N 個の数値を M けた半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_boss

# 入出力例
INPUT1 = <<~"EOS"
  4 3
  0
  8
  81
  813
EOS
OUTPUT1 = <<~"EOS"
  __0
  __8
  _81
  813
EOS

# 解答例1
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |a| puts("%#{m}d" % a) }

# 解答例2
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |a| puts("%*d" % [m, a]) }

# 解答例3
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |a| puts(sprintf("%*d", m, a)) }

# 解答例4
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |a| puts(format("%*d", m, a)) }

# 解答例5
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.to_i }
# 出力
ary.each { |a| puts(a.to_s.rjust(m, " ")) }
