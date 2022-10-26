# 大小関係 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__range_step4

INPUT1 = <<~"EOS"
  3
  1 2 1
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  7
  1 2 1 2 1 2 1
EOS
OUTPUT2 = <<~"EOS"
  5
EOS

_, *a = STDIN.read.split.map(&:to_i)

sec_count = 1.upto(a.length - 2).count do |i|
  a[i - 1] > a[i] && a[i] < a[i + 1] ||
  a[i - 1] < a[i] && a[i] > a[i + 1]
end

puts sec_count
