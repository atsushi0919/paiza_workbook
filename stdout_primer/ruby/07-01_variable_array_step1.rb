# N 個の文字を半分ずつ出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step1

# 入出力例
INPUT1 = <<~"EOS"
  8
EOS
OUTPUT1 = <<~"EOS"
  1 2 3 4
  5 6 7 8
EOS

# 解答例
# 入力 (n は偶数)
n = gets.to_i
# 配列生成
ary = (1..n).to_a
# 出力
puts(ary[...n / 2].join(" "))
puts(ary[n / 2..].join(" "))
