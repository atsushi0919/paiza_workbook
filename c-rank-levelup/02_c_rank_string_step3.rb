# 数字の文字列操作（基本） (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step3

INPUT1 = <<~"EOS"
  2134
EOS
OUTPUT1 = <<~"EOS"
  64
EOS
INPUT2 = <<~"EOS"
  0920
EOS
OUTPUT2 = <<~"EOS"
  011
EOS

=begin
# [解答例1]
s = gets.chomp
a = (s[0].to_i + s[3].to_i).to_s
b = (s[1].to_i + s[2].to_i).to_s
puts a + b
=end

# [解答例2]
ary = gets.split("").map(&:to_i)
p ary
a = (ary[0] + ary[3]).to_s
b = (ary[1] + ary[2]).to_s
puts a + b
