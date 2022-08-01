# 【しゃくとり法の練習問題】 復習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__syakutori_review_step1

INPUT1 = <<~"EOS"
  10 15
  2 6 20 4 2 15 4 5 6 8
EOS

OUTPUT1 = <<~"EOS"
  15
EOS

INPUT2 = <<~"EOS"
  8 13
  8 3 1 1 3 8 1 3
EOS

OUTPUT2 = <<~"EOS"
  25
EOS

def solve(input_str)
  n, k, *a = input_str.split.map(&:to_i)

  count = 0
  0.upto(n - 1) do |l|
    r = l
    section_sum = 0
    while (r < n)
      section_sum += a[r]
      break if section_sum > k
      count += 1
      r += 1
    end
  end
  count
end

puts solve(STDIN.read)
