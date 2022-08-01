# 改行区切りでの出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_step6

INPUT1 = <<~"EOS"
  2
  1 5
EOS
OUTPUT1 = <<~"EOS"
  1
  5
EOS

INPUT2 = <<~"EOS"
  3
  4 30 12
EOS
OUTPUT2 = <<~"EOS"
  4
  30
  12
EOS

# [解答例1]
# gets
# gets.split.each do |value|
#   puts value
# end

# [解答例2]
# gets
# puts gets.split

# [解答例3]
puts STDIN.read.split.slice(1..)
# 同じ
#puts STDIN.read.split[1..]
