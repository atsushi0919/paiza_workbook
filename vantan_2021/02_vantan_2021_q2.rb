# Q2: rot-x (paizaランク C 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q2_rot-x

INPUT1 = <<~"EOS"
  3
  abc
  zab
EOS
OUTPUT1 = <<~"EOS"
  correct rot-25
EOS

INPUT2 = <<~"EOS"
  3
  abc
  zbb
EOS
OUTPUT2 = <<~"EOS"
  fixed zab
EOS

INPUT3 = <<~"EOS"
  3
  abc
  zbc
EOS
OUTPUT3 = <<~"EOS"
  fixed abc
EOS

INPUT4 = <<~"EOS"
  3
  abc
  zcc
EOS
OUTPUT4 = <<~"EOS"
  incorrect
EOS

radix = 26
chr_base = 97
n, s, t = STDIN.read.split
n = n.to_i

rots = Array.new(n)
0.upto(n - 1) do |i|
  rots[i] = (t[i].ord - s[i].ord) % radix
end

case rots.uniq.length
when 1
  puts "correct rot-#{rots[0]}"
when 2
  tally = rots.tally.sort_by { |k, v| v }
  idx = rots.index(tally[0][0])
  rot = tally[1][0]
  t[idx] = ((s[idx].ord + rot - chr_base) % radix + chr_base).chr
  puts "fixed #{t}"
else
  puts "incorrect"
end
