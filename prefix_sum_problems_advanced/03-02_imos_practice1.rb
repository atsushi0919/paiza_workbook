# 【いもす法の練習問題】練習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__imos_practice_step1

INPUT1 = <<~"EOS"
  5 2
  1 5
  2 3
EOS

OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  8 3
  1 8
  1 3
  3 8
EOS

OUTPUT2 = <<~"EOS"
  1
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
  odd_count = 0
  s = [0]
  imos[...-1].each do |e|
    s << s[-1] + e
    odd_count += 1 if s[-1].odd?
  end
  odd_count
end

puts solve(STDIN.read)
