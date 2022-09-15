# Q5: ペイントソフト (paizaランク S 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q5_paint_software

INPUT1 = <<~"EOS"
  10 10 100 100
  70 50
  30 80
  50 40
  20 90
  2 10 30
  3 60 45
  4 35 95
  5 10 60
  6 25 85
  7 70 95
  8 10 85
  9 80 10
  10 35 20
  11 15 30
  1 1
  1 51
  7 99
  31 81
  90 10
  95 95
  35 95
  25 20
  40 51
  51 45
EOS
OUTPUT1 = <<~"EOS"
  11
  5
  8
  1
  9
  7
  4
  10
  1
  3
EOS

Rectangle = Struct.new(:x1, :y1, :x2, :y2, :z, :c)

def ol_area(r1, r2)
  l = [r1.x1, r2.x1].max
  r = [r1.x2, r2.x2].min
  b = [r1.y1, r2.y1].max
  t = [r1.y2, r2.y2].min
  l < r && b < t ? [l, b, r, t] : []
end

input_lines = STDIN.read.split("\n")
n, q, h, w = input_lines.shift.split.map(&:to_i)
x_y = input_lines.shift(4).map { |line| line.split.map(&:to_i) }
opes = input_lines.shift(n).map { |line| line.split.map(&:to_i) }
ques = input_lines.shift(q).map { |line| line.split.map(&:to_i) }

r0 = Rectangle.new(0, 0, x_y[0][0], x_y[0][1], 1, 1)
r1 = Rectangle.new(0, x_y[1][1], x_y[1][0], h, 1, 1)
r2 = Rectangle.new(x_y[2][0], x_y[2][1], w, h, 1, 1)
r3 = Rectangle.new(x_y[3][0], 0, w, x_y[3][1], 1, 1)
rects = [r0, r1, r2, r3]

# 左下と右上が繋がっていれば 左上と右下に長方形ができる
if r0.x2 >= r2.x1 && r0.y2 >= r2.y1
  rects << Rectangle.new(r0.x1, r0.y2, r2.x1, r2.y2, 1, 1)
  rects << Rectangle.new(r0.x2, r0.y1, r2.x2, r2.y1, 1, 1)
end
# 左上と右下が繋がっていれば 左下と右上に長方形ができる
if r1.x2 >= r3.x1 && r1.y1 <= r3.y2
  rects << Rectangle.new(r1.x1, r3.y1, r3.x1, r1.y1, 1, 1)
  rects << Rectangle.new(r1.x2, r3.y2, r3.x2, r1.y2, 1, 1)
end
# どちらも繋がっていなければ [0, 0, w, h] のキャンバスを追加
rects << Rectangle.new(0, 0, w, h, 0, 1) if rects.length == 4

# 長方形の重なりを調べる
z = 1
while true
  t_rects = rects.select { |r| r.z == z }
  break if t_rects.empty?
  len = t_rects.length
  0.upto(len - 1) do |i|
    (i + 1).upto(len - 1) do |j|
      next if i == j
      r1 = t_rects[i]
      r2 = t_rects[j]
      ol_area = ol_area(r1, r2)
      if not ol_area.empty?
        nr = Rectangle.new(*ol_area, z + 1, 1)
        next if rects.any? do |r|
          [r.x1, r.y1, r.x2, r.y2, r.z] == [nr.x1, nr.y1, nr.x2, nr.y2, nr.z]
        end
        rects << nr
      end
    end
  end
  z += 1
end

# 色を塗る
rects.sort_by! { |r| r.z }.reverse!
opes.each do |c, x, y|
  rects.each do |r|
    if r.x1 < x && x < r.x2 && r.y1 < y && y < r.y2
      r.c = c
      break
    end
  end
end

# 出力
puts ques.map { |x, y|
  rects.find { |r|
    r.x1 < x && x < r.x2 && r.y1 < y && y < r.y2
  }.c
}.join("\n")
