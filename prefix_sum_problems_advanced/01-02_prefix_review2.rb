# 【累積和の練習問題】復習問題 その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_review_step2

INPUT1 = <<~"EOS"
  10 4
  10 1 9 2 8 3 7 4 6 5
EOS

OUTPUT1 = <<~"EOS"
  22
EOS

INPUT2 = <<~"EOS"
  8 3
  813 138 318 111 888 333 381 831
EOS

OUTPUT2 = <<~"EOS"
  1602
EOS

def solve(input_str)
  _, k, *a = input_str.split.map(&:to_i)

  max_sum = 0
  s = [0]
  a.each.with_index(1) do |e, i|
    s << s[-1] + e
    next if i < k
    max_sum = [max_sum, s[i] - s[i - k]].max
  end
  max_sum
end

puts solve(STDIN.read)
