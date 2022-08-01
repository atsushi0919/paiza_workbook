# 【しゃくとり法の練習問題】 練習問題 その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__syakutori_practice_step2

INPUT1 = <<~"EOS"
  5
  1 2 3 4 5
EOS

OUTPUT1 = <<~"EOS"
  15
EOS

INPUT2 = <<~"EOS"
  10
  6 5 4 3 2 1 2 3 4 5
EOS

OUTPUT2 = <<~"EOS"
  20
EOS

def solve(input_str)
  n, *a = input_str.split.map(&:to_i)

  count = 0
  0.upto(n - 1) do |l|
    count += 1
    r = l + 1
    while (r < n)
      break if a[r - 1] > a[r]
      count += 1
      r += 1
    end
  end
  count
end

puts solve(STDIN.read)
