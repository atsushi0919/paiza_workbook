# 数字の文字列操作（時刻1） (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step5

INPUT1 = <<~"EOS"
  12:34
EOS
OUTPUT1 = <<~"EOS"
  12
  34
EOS
INPUT2 = <<~"EOS"
  01:03
EOS
OUTPUT2 = <<~"EOS"
  1
  3
EOS

# [解答例1]
time = gets.split(":").map(&:to_i)
puts time

# [解答例2]
h, m = gets.split(":")
time = Time.local(2021, 1, 1, h, m)
puts [time.hour, time.min]
