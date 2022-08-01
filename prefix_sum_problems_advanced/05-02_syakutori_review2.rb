# 【しゃくとり法の練習問題】 復習問題 その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__syakutori_review_step2

INPUT1 = <<~"EOS"
  10 15
  6 5 4 14 2 3 8 16 6 1
EOS

OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  8 13
  3 1 8 3 3 8 1 3
EOS

OUTPUT2 = <<~"EOS"
  3
EOS

def solve(input_str)
  n, k, *a = input_str.split.map(&:to_i)

  max_length = -Float::INFINITY
  0.upto(n - 1) do |l|
    r = l
    section_sum = 0
    while (r < n)
      section_sum += a[r]
      break if section_sum > k
      max_length = [max_length, r - l + 1].max
      r += 1
    end
  end
  max_length
end

puts solve(STDIN.read)
