# 1 つの整数の組の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step1

# 入出力例
INPUT1 = <<~"EOS"
  8 13
EOS
OUTPUT1 = <<~"EOS"
  8 13
EOS

# 解答例
# 入力
pair = gets.split.map(&:to_i)
# 出力
puts(pair.join(" "))
