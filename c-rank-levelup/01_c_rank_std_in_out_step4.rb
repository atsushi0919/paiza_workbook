# 入力の配列による保持 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_step4

INPUT1 = <<~"EOS"
  2
  4
  7
EOS
OUTPUT1 = <<~"EOS"
  7
EOS

INPUT2 = <<~"EOS"
  3
  20
  19
  2
EOS
OUTPUT2 = <<~"EOS"
  20
EOS

# [解答例1]
ary = []
max_num = 0
gets.to_i.times do
  num = gets.to_i
  max_num = num if max_num < num
  ary.push(num)
end
puts max_num

# [解答例2]
ary = gets.to_i.times.map { gets.to_i }
puts ary.max
