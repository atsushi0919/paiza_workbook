# ユークリッド距離 (paizaランク D 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__euclidean_distance

INPUT1 = <<~"EOS"
  0 0
  5 6
EOS
OUTPUT1 = <<~"EOS"
  7.810249675907
EOS

x1, y1, x2, y2 = STDIN.read.split.map(&:to_i)
e_d = ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5

puts e_d
