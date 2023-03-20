# ロボットの移動 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_robot_movement

INPUT1 = <<~"EOS"
  5 3
EOS
OUTPUT1 = <<~"EOS"
  8
EOS

# 解答例1-1
sx = 0  # スタート座標 x
sy = 0  # スタート座標 y
x, y = gets.split.map(&:to_i)

# マンハッタン距離
puts (x - sx).abs + (y - sy).abs

# 解答例1-2
x, y = gets.split.map(&:to_i)

# (0, 0) からのマンハッタン距離
puts x.abs + y.abs

# 解答例1-3
puts gets.split.map { |v| v.to_i.abs }.sum
