# 順列全列挙によるTSP (paizaランク B 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_exhaustive_enumeration

INPUT1 = <<~"EOS"
  4
  0 0
  2 2
  -1 1
  0 -2
EOS
OUTPUT1 = <<~"EOS"
  11.048627177541
  1 3 2 4
EOS

input_lines = STDIN.read.split("\n")
n = input_lines.shift.to_i
c = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
routes = (1..n).to_a.permutation.to_a

shortest_dist = Float::INFINITY
shortest_route = []
routes.each do |route|
  tmp_dist = 0
  0.upto(n - 1) do |i|
    x1, y1 = c[route[i] - 1]
    x2, y2 = c[route[(i + 1) % n] - 1]
    tmp_dist += ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
  end
  if tmp_dist < shortest_dist
    shortest_dist = tmp_dist
    shortest_route = route
  end
end

puts shortest_dist
puts shortest_route.join(" ")
