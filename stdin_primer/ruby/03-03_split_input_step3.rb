# 半角スペース区切りの 3 つの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step3

# 入出力例
INPUT1 = <<~"EOS"
  good morning paiza
EOS
OUTPUT1 = <<~"EOS"
  good
  morning
  paiza
EOS

INPUT2 = <<~"EOS"
  8 1 3
EOS
OUTPUT2 = <<~"EOS"
  8
  1
  3
EOS

INPUT3 = <<~"EOS"
  hello world 813
EOS
OUTPUT3 = <<~"EOS"
  hello
  world
  813
EOS

# 解答例1
# 入力
ary = gets.chomp.split(" ")
# 出力
puts(ary)

# 解答例2
# 入力
s1, s2, s3 = gets.chomp.split(" ")
# 出力
puts(s1)
puts(s2)
puts(s3)
