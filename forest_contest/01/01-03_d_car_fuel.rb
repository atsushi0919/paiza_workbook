# 自動車の燃費 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_car_fuel

INPUT1 = <<~"EOS"
  65 600
EOS
OUTPUT1 = <<~"EOS"
  9
EOS
INPUT2 = <<~"EOS"
  36 831
EOS
OUTPUT2 = <<~"EOS"
  23
EOS

# 解答例1
# 入力
v, d = gets.split.map(&:to_i)

# 燃費を出力
puts d / v

# 解答例2
# 入力
v, d = gets.split.map(&:to_i)

# 燃費を出力
puts d.div(v)
