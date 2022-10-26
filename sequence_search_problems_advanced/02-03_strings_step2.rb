# 部分文字列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_step2

INPUT1 = <<~"EOS"
  tyjq
  tyjq
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  mj
  mj
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

INPUT3 = <<~"EOS"
  x
  x
EOS
OUTPUT3 = <<~"EOS"
  1
EOS

INPUT4 = <<~"EOS"
  abcabc
  abc
EOS
OUTPUT4 = <<~"EOS"
  2
EOS

INPUT5 = <<~"EOS"
  aaaaaa
  aa
EOS
OUTPUT5 = <<~"EOS"
  0
EOS

s, t = STDIN.read.split

count = 0
left = 0
while left <= s.length - t.length
  idx = s[left..].index(t)
  break unless idx
  count += 1
  left += idx + 1
end

puts count
