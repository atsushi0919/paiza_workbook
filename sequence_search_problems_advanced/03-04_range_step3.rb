# 連続した要素区間の最大長 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__range_step3

INPUT1 = <<~"EOS"
  6
  5 5 1 1 1 5
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  7
  5 5 5 1 5 5 5
EOS
OUTPUT2 = <<~"EOS"
  3
EOS

INPUT3 = <<~"EOS"
  1
  999
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

_, *a = STDIN.read.split.map(&:to_i)

max_count = rep_count = 1
1.upto(a.length - 1) do |i|
  if a[i] == a[i - 1]
    rep_count += 1
    max_count = [max_count, rep_count].max
  else
    rep_count = 1
  end
end

puts max_count
