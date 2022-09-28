# 巡回路長の計算 (paizaランク C 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tour_distance

INPUT1 = <<~"EOS"
  3
  0 0
  1 0
  0 1
  1 2 3
EOS
OUTPUT1 = <<~"EOS"
  3.414213562373
EOS

INPUT2 = <<~"EOS"
  5
  -416 -37
  57 -864
  -292 647
  426 -796
  335 -506
  1 3 4 5 2
EOS

input_lines = STDIN.read.split("\n")
n = input_lines.shift.to_i
c = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
q = input_lines.shift.split.map(&:to_i)

total_dist = 0
0.upto(n - 1) do |i|
  x1, y1 = c[q[i] - 1]
  x2, y2 = c[q[(i + 1) % n] - 1]
  total_dist += ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
end

puts total_dist
