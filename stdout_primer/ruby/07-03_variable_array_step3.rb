# 直角三角形の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step3

# 入出力例
INPUT1 = <<~"EOS"
  4
EOS
OUTPUT1 = <<~"EOS"
  1
  1 2
  1 2 3
  1 2 3 4
EOS

INPUT2 = <<~"EOS"
  1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

# 解答例1
# 入力
n = gets.to_i
# 出力
1.upto(n) do |i|
  puts((1..i).to_a.join(" "))
end

# 解答例2
# 入力
n = gets.to_i
# 出力
1.upto(n) { |i| puts((1..i).to_a.join(" ")) }
