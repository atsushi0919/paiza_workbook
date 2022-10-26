# 連続した要素の区間 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__range_step2

INPUT1 = <<~"EOS"
  6 1 3
  5 5 1 1 1 5
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  7 5 2
  5 5 5 1 5 5 5
EOS
OUTPUT2 = <<~"EOS"
  4
EOS

INPUT3 = <<~"EOS"
  1 999 1
  999
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

_, x, k, *a = STDIN.read.split.map(&:to_i)

sec_count = rep_count = 0
a.each do |v|
  if v == x
    rep_count += 1 if rep_count < k
    sec_count += 1 if rep_count == k
  else
    rep_count = 0
  end
end

puts sec_count
