# カンマ区切りで 2 つ出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step1

# 入出力例
INPUT1 = <<~"EOS"
  5 1
EOS
OUTPUT1 = <<~"EOS"
  5,1
EOS

INPUT2 = <<~"EOS"
  2 1
EOS
OUTPUT2 = <<~"EOS"
  2,1
EOS

# 解答例1
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts("#{n},#{m}")

# 解答例2
# 入力
n, m = gets.split.map(&:to_i)
# 出力
puts(n.to_s + "," + m.to_s)
