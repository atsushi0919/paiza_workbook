# 最大イニング (paizaランク D 相当)

INPUT1 = <<~"EOS"
  99
  6
  16
  14
  22
  8
  11
  7
  10
  4
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  70
  6
  16
  14
  22
  8
  11
  7
  10
  4
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

INPUT3 = <<~"EOS"
  77
  6
  16
  14
  22
  8
  11
  7
  10
  4
EOS
OUTPUT3 = <<~"EOS"
  7
EOS

k, *a = STDIN.read.split.map(&:to_i)

res = "Yes"
total = 0
a.each.with_index(1) do |e, i|
  total += e
  if total > k
    res = i
    break
  end
end

puts res
