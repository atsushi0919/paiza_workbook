# 【累積和の練習問題】練習問題 その 4 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_practice_step4

INPUT1 = <<~"EOS"
  1
  1 100
EOS

OUTPUT1 = <<~"EOS"
  6
EOS

INPUT2 = <<~"EOS"
  3
  1 15
  15 100
  138 813
EOS

OUTPUT2 = <<~"EOS"
  1
  6
  45
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  n = input_lines.shift.to_i
  a = input_lines.map { |e| e.split.map(&:to_i) }

  a.map do |l, r|
    b = []
    s = [0]
    l.upto(r) do |x|
      b <<= x % 15 == 0 ? 1 : 0
      s << s[-1] + b[-1]
    end
    s[-1]
  end
end

puts solve(STDIN.read)
