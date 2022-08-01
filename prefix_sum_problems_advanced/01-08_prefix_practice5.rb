# 【累積和の練習問題】練習問題 その 5 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_practice_step5

INPUT1 = <<~"EOS"
  5
  1 2 3 4 5
EOS

OUTPUT1 = <<~"EOS"
  1
  2
  3
EOS

INPUT2 = <<~"EOS"
  9
  1 9 2 8 3 7 4 6 5
EOS

OUTPUT2 = <<~"EOS"
  1
  8
  7
  7
  6
  6
  5
EOS

def solve(input_str)
  n, *a = input_str.split.map(&:to_i)

  l, r = [0], [0]
  0.upto(n - 1) do |i|
    l << [l[-1], a[i]].max
    r << [r[-1], a[-i - 1]].max
  end

  1.upto(n - 2).map do |i|
    [l[i], r[n - i - 1]].min
  end
end

puts solve(STDIN.read)
