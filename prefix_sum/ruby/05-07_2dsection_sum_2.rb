# 【二次元累積和】 二次元累積和 7 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_boss2

INPUT1 = <<"EOS"
5 5 3
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
4 5 6 7 8
5 6 7 8 9
1 1 3 3
2 2 4 4
0 0 2 2
EOS
OUTPUT1 = <<"EOS"
45
63
27
EOS

INPUT2 = <<"EOS"
8 3 1
8 1 3
1 3 8
3 1 8
8 1 3
1 3 8
3 1 8
8 1 3
1 3 8
0 0 7 2
EOS
OUTPUT2 = <<"EOS"
96
EOS

def solve(input_str)
  # 入力
  input_lines = input_str.split("\n")
  h, w, q = input_lines.shift.split.map(&:to_i)
  a = input_lines.shift(h).map { |l| l.split.map(&:to_i) }
  rects = input_lines.shift(q).map { |l| l.split.map(&:to_i) }

  # 累積和
  s = Array.new(h + 1) { Array.new(w + 1, 0) }
  (0...h).each do |y|
    (0...w).each do |x|
      s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
    end
  end

  # 長方形の区間和を改行で連結した文字列を返す
  rects.map { |sy, sx, gy, gx| s[gy + 1][gx + 1] - s[sy][gx + 1] - s[gy + 1][sx] + s[sy][sx] }.join("\n")
end

puts solve($stdin.read)
