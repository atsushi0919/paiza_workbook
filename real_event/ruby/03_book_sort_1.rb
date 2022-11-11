# 本の整理 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/book_sort

INPUT1 = <<~"EOS"
  5
  5 4 3 2 1
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  10
  8 7 9 1 5 6 2 10 4 3
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

INPUT3 = <<~"EOS"
  15
  8 5 10 6 4 11 12 3 9 1 13 2 15 14 7
EOS
OUTPUT3 = <<~"EOS"
  10
EOS

def solve(input_lines)
  n, *a = input_lines.split.map(&:to_i)
  b = a.each_with_index.to_h

  count = 0
  0.upto(n - 1) do |i|
    next if a[i] == i + 1
    j = b[i + 1]
    b[a[i]], b[i + 1] = b[i + 1], b[a[i]]
    a[i], a[j] = a[j], a[i]
    count += 1
  end
  count
end

puts solve(INPUT3)
