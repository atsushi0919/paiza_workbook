# 動的計画法によるTSP (2) (paizaランク A 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_dynamic_2

INPUT1 = <<~"EOS"
  4
  0 0
  2 2
  -1 1
  0 -2
EOS
OUTPUT1 = <<~"EOS"
  11.048627177541
  1 3 0 2
EOS

def e_dist(x1, y1, x2, y2)
  ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
end

input_lines = STDIN.read.split("\n")
n = input_lines.shift.to_i
coords = input_lines.map { |l| l.split.map(&:to_i) }

start = rand(n)
bw = 1 << n
d = Array.new(n) { Array.new(bw, Float::INFINITY) }
before = Array.new(n) { Array.new(bw) }

# 集合 S のサイズが 1 の場合
(0...n).each do |i|
  d[i][1 << i] = e_dist(*coords[start], *coords[i])
  before[i][1 << i] = start
end

# 集合のサイズを 1 つずつ大きくしていく
(0...bw).each do |b|
  (0...n).each do |i|
    next if (b >> i) & 1 == 0
    (0...n).each do |j|
      next if (b >> j) & 1 == 1
      tmp = d[i][b] + e_dist(*coords[i], *coords[j])
      if tmp < d[j][b | (1 << j)]
        d[j][b | (1 << j)] = tmp
        before[j][b | (1 << j)] = i
      end
    end
  end
end

# 巡回路
tour = Array.new(n)
pos = start
b = bw - 1
(0...n).each do |i|
  tour[i] = before[pos][b]
  b = b ^ (1 << pos)
  pos = tour[i]
end

puts d[start][bw - 1]
puts tour.join(" ")
