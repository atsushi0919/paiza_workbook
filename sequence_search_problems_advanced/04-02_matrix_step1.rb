# 二次元データ 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step1

INPUT1 = <<~"EOS"
  2 3 3
  1 2 3
  3 4 5
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  1 1 2
  1
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

input_lines = STDIN.read.split("\n")
_, _, k = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

puts a.map { |l| l.count(k) }.sum
