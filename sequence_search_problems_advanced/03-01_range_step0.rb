# 区間探索 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__range_step0

INPUT1 = <<~"EOS"
  7 3
  1 1 5 5 5 5 1
EOS
OUTPUT1 = <<~"EOS"
  4
EOS

INPUT2 = <<~"EOS"
  4 5
  1 5 5 5
EOS
OUTPUT2 = <<~"EOS"
  3
EOS

INPUT3 = <<~"EOS"
  1 1000
  1000
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

_, x, *a = INPUT4.split.map(&:to_i)

max_count = rep_count = 0
a.each do |v|
  if v >= x
    rep_count += 1
    max_count = [max_count, rep_count].max
  else
    rep_count = 0
  end
end

puts max_count
