# 三次元データ (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step4

INPUT1 = <<~"EOS"
  2 3 3 2
  1 1 1
  1 1 1
  2 2 2
  2 2 2
  3 3 3
  3 3 3
EOS
OUTPUT1 = <<~"EOS"
  6
EOS

INPUT2 = <<~"EOS"
  3 3 3 1
  1 2 3
  4 5 1
  2 3 4
  5 1 2
  3 4 5
  1 2 3
  4 5 1
  2 3 4
  5 1 2
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

input_lines = STDIN.read.split("\n")
n, m, h, x = input_lines.shift.split.map(&:to_i)
cuboid = input_lines.each_slice(n).map do |layer|
  layer.map { |line| line.split.map(&:to_i) }
end

puts cuboid.flatten.count(x)
