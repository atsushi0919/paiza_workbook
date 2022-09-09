# ペアソート (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step4

INPUT1 = <<~"EOS"
  4
  11 21
  1 100
  100 200
  11 20
EOS
OUTPUT1 = <<~"EOS"
  1 100
  11 20
  11 21
  100 200
EOS

INPUT2 = <<~"EOS"
  4
  1 1
  1 1
  1 3
  1 2
EOS
OUTPUT2 = <<~"EOS"
  1 1
  1 1
  1 2
  1 3 
EOS

input_lines = STDIN.read.split("\n")
a = input_lines[1..].map { |line| line.split.map(&:to_i) }

puts a.sort.map { |line| line.join(" ") }.join("\n")
