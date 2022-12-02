# 気温2 (paizaランク C 相当)

INPUT1 = <<~"EOS"
  5
  -2 5 13 1 4
EOS
OUTPUT1 = <<~"EOS"
  15
EOS

INPUT2 = <<~"EOS"
  3
  -20 0 40
EOS
OUTPUT2 = <<~"EOS"
  60
EOS

n, *x = $stdin.read.split.map(&:to_i)

puts x.max - x.min
