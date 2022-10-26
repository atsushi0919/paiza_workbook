# 前後関係の基本 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step0

INPUT1 = <<~"EOS"
  3
  1 -4 -4
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  5
  0 0 0 -1 5
EOS
OUTPUT2 = <<~"EOS"
  2
EOS

_, *a = STDIN.read.split.map(&:to_i)

puts a.each_cons(2).count { |a, b| a == b }
