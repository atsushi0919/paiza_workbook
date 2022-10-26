# 連続する k 要素 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step2

INPUT1 = <<~"EOS"
  3 3
  -50 -50 -50
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  2 2
  -42 -42
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

_, k, *a = STDIN.read.split.map(&:to_i)

max_idx = -1
max_sum = -Float::INFINITY
a.each_cons(k).with_index(1) do |nums, idx|
  tmp_sum = nums.sum
  if tmp_sum > max_sum
    max_idx = idx
    max_sum = tmp_sum
  end
end

puts max_idx
