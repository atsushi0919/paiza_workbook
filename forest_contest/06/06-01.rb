# 球数制限 (paizaランク D 相当)

INPUT1 = <<~"EOS"
  5 100
  12
  14
  20
  8
  17
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

n, k, *a = STDIN.read.split.map(&:to_i)

puts a.sum <= k ? "Yes" : "No"
