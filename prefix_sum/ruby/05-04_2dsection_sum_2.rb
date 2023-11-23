# 二次元累積和 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_step4

INPUT1 = <<"EOS"
1 1 3 3
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
4 5 6 7 8
5 6 7 8 9
EOS
OUTPUT1 = <<"EOS"
45
EOS

INPUT2 = <<"EOS"
0 0 4 4
8 1 3 8 1
1 3 8 1 3
3 8 1 3 8
8 1 3 8 1
1 3 8 1 3
EOS
OUTPUT2 = <<"EOS"
97
EOS

# 入力
h, w = 5, 5
input_lines = $stdin.read.split("\n")
sy, sx, gy, gx = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

# 累積和
s = Array.new(h + 1) { Array.new(w + 1, 0) }
(0...h).each do |y|
  (0...w).each do |x|
    s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
  end
end

# 長方形の区間和を出力
section_sum = s[gy + 1][gx + 1] - s[sy][gx + 1] - s[gy + 1][sx] + s[sy][sx]
puts section_sum
