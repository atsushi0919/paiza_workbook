# ロボットの移動 (paizaランク D 相当)

INPUT1 = <<~"EOS"
  5 3
EOS
OUTPUT1 = <<~"EOS"
  8
EOS

x, y = STDIN.read.split.map(&:to_i)

# ((x ** 2 - 0 ** 2) + (y ** 2 - 0 ** 2)) ** 0.5
puts x.abs + y.abs
