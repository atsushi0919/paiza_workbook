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

# s と t を先頭から順に何文字シフトか調べる
rots = Array.new(n)
0.upto(n - 1) do |i|
  rots[i] = (t[i].ord - s[i].ord) % radix
end

# 調べた結果を key: シフト数, value: 文字数で集計して value でソート
res = rots.tally.sort_by { |k, v| v }

# res の要素数が 1 なら正解 -> "correct rot-xx"
# res の要素数が 2 かつ間違い文字数が 1 なら修正 -> "fixed t"
# それ以外は不正解 -> "incorrect"
len = res.length
if len == 1
  puts "correct rot-#{res[0][0]}"
elsif len == 2 && res[0][1] == 1
  idx = rots.index(res[0][0])
  rot = res[1][0]
  t[idx] = ((s[idx].ord + rot - chr_base) % radix + chr_base).chr
  puts "fixed #{t}"
else
  puts "incorrect"
end
