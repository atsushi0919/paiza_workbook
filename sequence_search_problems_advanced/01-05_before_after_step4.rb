# 部分数列 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step4

INPUT1 = <<~"EOS"
  1 1
  -53
  -53
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  3 1
  89 -17 -76
  28
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

input_lines = STDIN.read.split("\n")
_, m = input_lines.shift.split.map(&:to_i)
a = input_lines.shift.split.map(&:to_i)
b = input_lines.shift.split.map(&:to_i)

matched_idx = -1
a.each_cons(m).with_index(1) do |nums, idx|
  if nums == b
    matched_idx = idx
    break
  end
end

puts matched_idx
