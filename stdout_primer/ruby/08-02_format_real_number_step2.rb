# 1 つの実数を出力 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_step2

# 入出力例
INPUT1 = <<~"EOS"
  0.813
EOS
OUTPUT1 = <<~"EOS"
  0.813
EOS

INPUT2 = <<~"EOS"
  10000000000.5
EOS
OUTPUT2 = <<~"EOS"
  10000000000.5
EOS

# 解答例1
# 入力
n = gets.to_f
# 出力
puts(n)

# 解答例2
# 入力
n = gets.to_f
# 出力
p(n)
