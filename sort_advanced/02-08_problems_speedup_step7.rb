# 文字列のソート (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step7

INPUT1 = <<~"EOS"
  4
  b
  ab
  a
  aa
EOS
OUTPUT1 = <<~"EOS"
  a
  b
  aa
  ab
EOS

INPUT2 = <<~"EOS"
  1
  a
EOS
OUTPUT2 = <<~"EOS"
  a
EOS

INPUT3 = <<~"EOS"
  3
  a
  a
  a
EOS
OUTPUT3 = <<~"EOS"
  a
  a
  a
EOS

_, *s = STDIN.read.split

puts s.sort! { |a, b| [a.length, a] <=> [b.length, b] }
