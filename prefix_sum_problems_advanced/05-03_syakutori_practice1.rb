# 【しゃくとり法の練習問題】 練習問題 その 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__syakutori_practice_step1

INPUT1 = <<~"EOS"
  5 100
  10 20 30 40 50
EOS

OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  5 100
  1 2 3 4 5
EOS

OUTPUT2 = <<~"EOS"
  -1
EOS

def solve(input_str)
  n, k, *a = input_str.split.map(&:to_i)

  min_length = Float::INFINITY
  0.upto(n - 1) do |l|
    r = l
    section_sum = 0
    while (r < n)
      section_sum += a[r]
      if section_sum > k
        min_length = [min_length, r - l + 1].min
        break
      end
      r += 1
    end
  end
  min_length.infinite? ? -1 : min_length
end

puts solve(STDIN.read)
