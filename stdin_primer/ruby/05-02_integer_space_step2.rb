# 2 つの整数の半角スペース区切りの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_step2

# 入出力例
INPUT1 = <<~"EOS"
  8 13
EOS
OUTPUT1 = <<~"EOS"
  8
  13
EOS

INPUT2 = <<~"EOS"
  1234 5678
EOS
OUTPUT2 = <<~"EOS"
  1234
  5678
EOS

# 解答例
# 入力
a, b = gets.split.map(&:to_i)
# 出力
puts(a)
puts(b)
