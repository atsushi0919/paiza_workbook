# すべての行の長さが不定な 2 次元配列の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step4

# 入出力例
INPUT1 = <<~"EOS"
  4
  2 4 3 1
EOS
OUTPUT1 = <<~"EOS"
  1 2
  1 2 3 4
  1 2 3
  1
EOS

INPUT2 = <<~"EOS"
  1
  1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

# 解答例1
# 入力
n = gets.to_i
ary = gets.split.map(&:to_i)
# 出力
ary.each do |m|
  puts((1..m).to_a.join(" "))
end

# 解答例2
# 入力
n = gets.to_i
ary = gets.split.map(&:to_i)
# 出力
ary.each { |m| puts((1..m).to_a.join(" ")) }
