# 最大最小 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_simple_step1

INPUT1 = <<~"EOS"
  5
  1 3 5 7 9
EOS
OUTPUT1 = <<~"EOS"
  9 1
EOS

INPUT2 = <<~"EOS"
  5
  4 3 9 1 2
EOS
OUTPUT2 = <<~"EOS"
  9 1
EOS

INPUT3 = <<~"EOS"
  1
  100
EOS
OUTPUT3 = <<~"EOS"
  100 100
EOS

_, *a = STDIN.read.split.map(&:to_i)
puts a.minmax.reverse.join(" ")
