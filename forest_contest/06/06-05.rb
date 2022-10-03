# 中央値 (paizaランク C 相当)

INPUT1 = <<~"EOS"
  92
  35
  61
  81
  65
EOS
EOS1 = <<~"EOS"
  65
EOS

a = STDIN.read.split.map(&:to_i)

# a.length = 5 (odd)
# 5 / 2 -> 2
puts a.sort[2]
