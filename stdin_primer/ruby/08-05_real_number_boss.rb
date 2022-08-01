#　1 行目で与えられる N 個の実数の入力 (large) (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_boss

# 入出力例
INPUT1 = <<~"EOS"
  5 8.13 81.3 813 0.813 1.381
EOS
OUTPUT1 = <<~"EOS"
  8.13
  81.3
  813
  0.813
  1.381
EOS

# 解答例1
# 入力
ary = gets.split[1..].map(&:to_f)
# 出力
puts(ary)

# 解答例2
# 入力
n, *ary = gets.split
# n を整数型に変換
n = n.to_i
# aryの各要素を浮動小数点型に変換
ary.map!(&:to_f)
# 出力
puts(ary)
