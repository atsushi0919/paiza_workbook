# マンハッタン距離 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step8

INPUT1 = <<~"EOS"
  4
  1 1
  0 0
  10 10
  -2 1
EOS
OUTPUT1 = <<~"EOS"
  0 0
  1 1
  -2 1
  10 10
EOS

points = STDIN.read.split("\n")[1..].map { |line| line.split.map(&:to_i) }

# 原点からのマンハッタン距離でソート
points.sort! { |a, b| a.map(&:abs).sum <=> b.map(&:abs).sum }
puts points.map { |line| line.join(" ") }
