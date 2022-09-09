# 座標圧縮 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step9

INPUT1 = <<~"EOS"
  6 4
  11 6 16 5 2 13
  5 11 13 2
EOS
OUTPUT1 = <<~"EOS"
  2
  4
  5
  1
EOS

input_lines = STDIN.read.split("\n")
n, q = input_lines.shift.split.map(&:to_i)
a, x = input_lines.map { |line| line.split.map(&:to_i) }

a.sort!
s_a = {}
a.each.with_index(1) { |e, i| s_a[e] = i }

puts x.map { |e| s_a[e] }.join("\n")
