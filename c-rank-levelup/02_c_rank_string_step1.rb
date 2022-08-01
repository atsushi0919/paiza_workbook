# 整数と文字列 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step1

INPUT1 = <<~"EOS"
  2
  10
  100
EOS
OUTPUT1 = <<~"EOS"
  2
  3
EOS

INPUT2 = <<~"EOS"
  3
  1234
  0
  99
EOS
OUTPUT2 = <<~"EOS"
  4
  1
  2
EOS

# [解答例1]
n = gets.to_i
n.times do
  s = gets
  puts s.length
end

# [解答例2]
gets.to_i.times { puts gets.chomp.length }
