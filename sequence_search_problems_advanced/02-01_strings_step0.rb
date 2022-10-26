# 文字の探索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_step0

INPUT1 = <<~"EOS"
  fa
  f
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  ii
  i
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

INPUT3 = <<~"EOS"
  ivuyo
  i
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

s, c = STDIN.read.split

puts s.index(c) + 1
