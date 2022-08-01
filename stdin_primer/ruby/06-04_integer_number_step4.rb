# 2 行目で与えられる N 個の整数の入力 (large) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step4

# 入出力例
INPUT1 = <<~"EOS"
  5
  8 1 3 10 100
EOS
OUTPUT1 = <<~"EOS"
  8
  1
  3
  10
  100
EOS

# 解答例
# 1 行目の入力
n = gets.to_i
# 2 行目の入力
ary = gets.split.map(&:to_i)
# 出力
puts(ary)

# 解答例2
# 1 行目の入力
n = gets.to_i
# 2 行目の入力
ary = []
gets.split.each do |num|
  ary.push(num.to_i)
end
# 出力
puts(ary)
