# 【2 次元上のいもす法の練習問題】 練習問題 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__2dimos_practice

INPUT1 = <<~"EOS"
  3 1 3
  1 2 1
  2 1 2
  1 2 1
  1 1
EOS

OUTPUT1 = <<~"EOS"
  5
EOS

INPUT2 = <<~"EOS"
  3 2 2
  1 2 1
  2 1 2
  1 2 1
  1 1
  2 2
EOS

OUTPUT2 = <<~"EOS"
  3
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  # n: 行列サイズ, q: 敵体力, m: 魔法範囲
  n, q, m = input_lines.shift.split.map(&:to_i)
  a = input_lines.shift(n).map { |e| e.split.map(&:to_i) }
  b = input_lines.map { |e| e.split.map(&:to_i) }

  # 2D いもす
  imos = Array.new(n + 1) { Array.new(n + 1, 0) }
  # (x, y) : 範囲の左上
  b.each do |x, y|
    imos[y - 1][x - 1] += 1
    imos[y - 1][x + m - 1] -= 1
    imos[y + m - 1][x - 1] -= 1
    imos[y + m - 1][x + m - 1] += 1
  end

  # 累積和
  count = 0
  s = Array.new(n + 1) { Array.new(n + 1, 0) }
  0.upto(n - 1) do |y|
    0.upto(n - 1) do |x|
      s[y + 1][x + 1] = imos[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
      count += 1 if a[y][x] <= s[y + 1][x + 1]
    end
  end
  count
end

puts solve(STDIN.read)
