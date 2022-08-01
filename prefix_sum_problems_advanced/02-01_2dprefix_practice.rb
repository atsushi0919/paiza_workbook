# 【二次元累積和の練習問題】練習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__2dprefix_practice_step1

INPUT1 = <<~"EOS"
  3 1 1
  1 2 3
  4 5 6
  7 8 9
EOS
OUTPUT1 = <<~"EOS"
  9
EOS

INPUT2 = <<~"EOS"
  3 3 1
  1 2 3
  4 5 6
  7 8 9
EOS
OUTPUT2 = <<~"EOS"
  24
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  n, w, h = input_lines.shift.split.map(&:to_i)
  a = input_lines.map { |l| l.split.map(&:to_i) }

  # 累積和
  s = Array.new(n + 1) { Array.new(n + 1, 0) }
  0.upto(n - 1) do |y|
    0.upto(n - 1) do |x|
      s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
    end
  end

  # 長方形領域内の計算
  max_sum = -1
  0.upto(n - h) do |y|
    0.upto(n - w) do |x|
      area_sum = s[y + h][x + w] - s[y][x + w] - s[y + h][x] + s[y][x]
      max_sum = [max_sum, area_sum].max
    end
  end
  max_sum
end

puts solve(STDIN.read)
