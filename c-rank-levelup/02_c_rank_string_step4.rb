# 数字の文字列操作（0埋め） (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step4

INPUT1 = <<~"EOS"
  7
EOS
OUTPUT1 = <<~"EOS"
  007
EOS
INPUT2 = <<~"EOS"
  123
EOS
OUTPUT2 = <<~"EOS"
  123
EOS

# [解答例1]
#n = gets.chomp
#zero = "0" * (3 - n.length)
#puts zero << n

# [解答例2]
#puts gets.chomp.rjust(3, "0")

# [解答例3]
puts sprintf("%03d", gets.to_i)

# [解答例4]
#puts "%03d" % gets.to_i
