# 1 つの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step1

# 入出力例
INPUT1 = <<~"EOS"
  hello
EOS
OUTPUT1 = <<~"EOS"
  hello
EOS

INPUT2 = <<~"EOS"
  8132020
EOS
OUTPUT2 = <<~"EOS"
  8132020
EOS

INPUT3 = <<~"EOS"
  paiza813
EOS
OUTPUT3 = <<~"EOS"
  paiza813
EOS

# 解答例1
# 入力
s = gets.chomp
# 出力
puts(s)

# 解答例2
# 入力
s = gets
# 出力
puts(s)
