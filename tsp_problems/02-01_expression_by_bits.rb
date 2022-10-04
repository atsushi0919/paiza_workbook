# ビットによる集合の表現 (paizaランク C 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__expression_by_bits

INPUT1 = <<~"EOS"
  6 5
  3 5 0 2 1
EOS
OUTPUT1 = <<~"EOS"
  47
EOS

_, _, *a = STDIN.read.split.map(&:to_i)

puts a.map { |b| 1 << b }.sum
