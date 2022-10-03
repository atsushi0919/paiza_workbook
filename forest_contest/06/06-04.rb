# 最大の差 (paizaランク C 相当)

INPUT1 = <<~"EOS"
  35
  48
  51
  67
  72
EOS
OUTPUT1 = <<~"EOS"
  37
EOS

a = STDIN.read.split.map(&:to_i)

puts a.max - a.min
