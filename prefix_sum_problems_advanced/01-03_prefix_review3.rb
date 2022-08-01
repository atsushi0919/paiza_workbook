# 【累積和の練習問題】復習問題 その 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_review_step3

INPUT1 = <<~"EOS"
  13 3 8 a
  paizalearning
EOS

OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  30 10 20 p
  papapaizapapaizapaizapapapaiza
EOS

OUTPUT2 = <<~"EOS"
  2
EOS

def solve(input_str)
  _, x, y, c, str = input_str.split
  x, y = [x, y].map(&:to_i)

  a = str.chars.map { |chr| chr == c ? 1 : 0 }
  s = [0]
  a.each { |e| s << s[-1] + e }
  s[y] - s[x - 1]
end

puts solve(STDIN.read)
