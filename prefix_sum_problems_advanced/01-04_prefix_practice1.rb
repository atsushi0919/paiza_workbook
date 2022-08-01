# 【累積和の練習問題】練習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_practice_step1

INPUT1 = <<~"EOS"
  5
  1 2 3 4 5
EOS

OUTPUT1 = <<~"EOS"
  35
EOS

INPUT2 = <<~"EOS"
  7
  8 1 3 -81 8 1 3
EOS

OUTPUT2 = <<~"EOS"
  29
EOS

def solve(input_str)
  _, *a = input_str.split.map(&:to_i)

  blackbord = max_val = 0
  s = [0]
  a.each do |v|
    s << s[-1] + v
    blackbord += s[-1]
    max_val = [max_val, blackbord].max
  end
  max_val
end

puts solve(STDIN.read)
