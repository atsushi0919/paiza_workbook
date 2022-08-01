# 【二次元累積和の練習問題】練習問題 その 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__2dprefix_practice_step2

INPUT1 = <<~"EOS"
  3 1
  1 2 3
  4 5 6
  7 8 9
EOS
OUTPUT1 = <<~"EOS"
  9
EOS

INPUT2 = <<~"EOS"
  3 4
  1 2 3
  4 5 6
  7 8 9
EOS
OUTPUT2 = <<~"EOS"
  28
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  n, q = input_lines.shift.split.map(&:to_i)
  a = input_lines.map { |l| l.split.map(&:to_i) }

  s = Array.new(n + 1) { Array.new(n + 1, 0) }
  0.upto(n - 1) do |y|
    0.upto(n - 1) do |x|
      s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
    end
  end

  # 面積が q 以下の長方形リスト
  rectangles = []
  1.upto(n) do |s_h|
    1.upto(s_h) do |s_w|
      break if s_h * s_w > q
      rectangles << [s_h, s_w]
      rectangles << [s_w, s_h] if s_h != s_w
    end
  end

  # 長方形領域内の計算
  max_sum = -1
  rectangles.each do |s_h, s_w|
    0.upto(n - s_h) do |y|
      0.upto(n - s_w) do |x|
        area_sum = s[y + s_h][x + s_w] - s[y][x + s_w] - s[y + s_h][x] + s[y][x]
        max_sum = [max_sum, area_sum].max
      end
    end
  end
  max_sum
end

puts solve(STDIN.read)
