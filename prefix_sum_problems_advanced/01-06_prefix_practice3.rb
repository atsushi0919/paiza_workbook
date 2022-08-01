# 【累積和の練習問題】練習問題 その 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_practice_step3

INPUT1 = <<~"EOS"
  5
  1 2 3 4 5
EOS

OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  6
  1 1 1 1 1 1
EOS

OUTPUT2 = <<~"EOS"
  0
EOS

def solve(input_str)
  n, *a = input_str.split.map(&:to_i)

  sum1 = [0]
  sum2 = [0]
  total = a.sum
  min_dif = Float::INFINITY
  0.upto(n - 1) do |k|
    sum1 << sum1[-1] + a[k]
    sum2 << total - sum1[-1]
    min_dif = [min_dif, (sum1[-1] - sum2[-1]).abs].min
  end
  min_dif
end

puts solve(STDIN.read)
