# 【いもす法の練習問題】復習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__imos_review_step1

INPUT1 = <<~"EOS"
  5 2
  1 4
  2 5
EOS

OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  8 3
  1 3
  3 8
  1 8
EOS

OUTPUT2 = <<~"EOS"
  3
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  n, q = input_lines.shift.split.map(&:to_i)
  a = input_lines.map { |e| e.split.map(&:to_i) }

  # いもす
  imos = [0] * (n + 1)
  a.each do |l, r|
    imos[l - 1] += 1
    imos[r] -= 1
  end

  # 累積和
  max_sum = -Float::INFINITY
  s = [0]
  imos[...-1].each do |e|
    s << s[-1] + e
    max_sum = [max_sum, s[-1]].max
  end
  max_sum
end

puts solve(STDIN.read)
