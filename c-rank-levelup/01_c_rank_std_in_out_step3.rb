# 複数行にわたる入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_step3

INPUT1 = <<~"EOS"
  2
  1
  2
EOS
OUTPUT1 = <<~"EOS"
  1
  2
EOS

INPUT2 = <<~"EOS"
  3
  10
  5
  39
EOS
OUTPUT2 = <<~"EOS"
  10
  5
  39
EOS

# [解答例1]
# 回数 n を受け取り整数に変換する
n = gets.to_i
# n 回分の標準入力をそのまま出力する
n.times { puts gets }

# [解答例2]
get.to_i.times { puts gets }
