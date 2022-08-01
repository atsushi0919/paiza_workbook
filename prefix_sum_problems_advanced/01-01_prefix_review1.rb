# 【累積和の練習問題】復習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_review_step1

INPUT1 = <<~"EOS"
  5 0 4
  1 2 3 4 5
EOS

OUTPUT1 = <<~"EOS"
  15
EOS

INPUT2 = <<~"EOS"
  8 1 3
  8 1 3 8 1 3 8 1
EOS

OUTPUT2 = <<~"EOS"
  12
EOS

def solve(input_str)
  _, l, r, *a = input_str.split.map(&:to_i)

  s = [0]
  a.each { |e| s << s[-1] + e }
  s[r + 1] - s[l]
end

puts solve(STDIN.read)
