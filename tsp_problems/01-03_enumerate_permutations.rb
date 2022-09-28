# 順列全列挙 (paizaランク B 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__enumerate_permutations

INPUT1 = <<~"EOS"
  3
EOS
OUTPUT1 = <<~"EOS"
  1 3 2
  2 3 1
  3 1 2
  2 1 3
  3 2 1
  1 2 3
EOS

n = gets.to_i
puts (1..n).to_a.permutation.map { |e| e.join(" ") }.join("\n")
