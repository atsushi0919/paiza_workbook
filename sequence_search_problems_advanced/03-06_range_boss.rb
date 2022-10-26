# 大小関係 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__range_boss

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
  15
EOS

def sandwiched?(a, mid)
  a[mid - 1] > a[mid] && a[mid] < a[mid + 1] ||
  a[mid - 1] < a[mid] && a[mid] > a[mid + 1]
end

_, *a = STDIN.read.split.map(&:to_i)

r_limit = a.length - 2
sec_count = 0
1.upto(r_limit) do |mid|
  if sandwiched?(a, mid)
    sec_count += 1
    mid += 1
    while mid <= r_limit
      break unless sandwiched?(a, mid)
      sec_count += 1
      mid += 1
    end
  end
end

puts sec_count
