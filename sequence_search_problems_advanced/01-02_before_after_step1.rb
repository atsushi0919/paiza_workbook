# 連続する 3 要素 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step1

INPUT1 = <<~"EOS"
  3
  -5 -62 49
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  3
  -99 -59 99
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

_, *a = STDIN.read.split.map(&:to_i)

max_idx = -1
max_sum = -Float::INFINITY
a.each_cons(3).with_index(1) do |nums, idx|
  tmp_sum = nums.sum
  if tmp_sum > max_sum
    max_idx = idx
    max_sum = tmp_sum
  end
end

puts max_idx
