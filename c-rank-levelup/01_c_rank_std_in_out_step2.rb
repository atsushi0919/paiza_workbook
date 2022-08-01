# 複数行にわたる出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_step2

INPUT1 = <<~"EOS"
  2
EOS
OUTPUT1 = <<~"EOS"
  paiza
  paiza
EOS

INPUT2 = <<~"EOS"
  5
EOS
OUTPUT2 = <<~"EOS"
  paiza
  paiza
  paiza
  paiza
  paiza
EOS

# 文字列 "paiza\n" を n 回 表示する
# 例1
#puts "paiza\n" * gets.to_i

# 例2
#gets.to_i.times { puts "paiza" }

# n 個の要素を "paiza" で初期化した配列を作る
puts Array.new(gets.to_i, "paiza")
