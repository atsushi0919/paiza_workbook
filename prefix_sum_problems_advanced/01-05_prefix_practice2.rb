# 【累積和の練習問題】練習問題 その 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__prefix_practice_step2

INPUT1 = <<~"EOS"
  12 1 12
  aapizaapizaa
EOS

OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  12 4 12
  aapizaapizaa
EOS

OUTPUT2 = <<~"EOS"
  1
EOS

INPUT3 = <<~"EOS"
  12 1 9
  aapizaapizaa
EOS

OUTPUT3 = <<~"EOS"
  1
EOS

def solve(input_str)
  tmp, str = input_str.split("\n")
  n, a, b = tmp.split.map(&:to_i)

  s = Array.new(n + 1, 0)
  0.upto(n - 3) do |i|
    s[i + 1] = s[i]
    if str[i] == "p" && str[i + 1] == "i" && str[i + 2] == "z"
      s[i + 1] += 1
    end
  end

  s[b - 3] - s[a - 1]
end

puts solve(STDIN.read)
