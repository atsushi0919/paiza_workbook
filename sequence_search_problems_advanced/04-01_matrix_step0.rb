# 二次元データ 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step0

INPUT1 = <<~"EOS"
  2 3
  a.b
  .c.
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  1 1
  .
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

_, _, *a = STDIN.read.split

puts a.map { |s| s.count(".") }.sum
