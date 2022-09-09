# 区間のソート (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_simple_boss

INPUT1 = <<~"EOS"
  6 2 6
  6 5 4 3 2 1
EOS
OUTPUT1 = <<~"EOS"
  6 2 3 4 5 1
EOS

INPUT2 = <<~"EOS"
  6 1 7
  6 5 4 3 2 1
EOS
OUTPUT2 = <<~"EOS"
  1 2 3 4 5 6
EOS

INPUT3 = <<~"EOS"
  1 1 2
  1
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

_, l, r, *a = STDIN.read.split.map(&:to_i)
l -= 1
r -= 2
a[l..r] = a[l..r].sort
puts a.join(" ")
