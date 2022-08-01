# 数値を異なる長さで 2 行出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step2

# 入出力例
INPUT1 = <<~"EOS"
  3 5
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
  1 2 3 4 5
EOS

# 解答例
# 入力
n, m = gets.split.map(&:to_i)
# ary_n: 1 以上 n 以下の整数の配列
ary_n =(1..n).to_a
# ary_m: 1 以上 m 以下の整数の配列
ary_m =(1..m).to_a
# 出力
puts(ary_n.join(" "))
puts(ary_m.join(" "))
