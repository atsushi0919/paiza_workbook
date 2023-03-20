# 中央値 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_median

INPUT1 = <<"EOS"
92
35
61
81
65
EOS
EOS1 = <<"EOS"
65
EOS

# 解答例1-1
n = 5
a = n.times.map { gets.to_i }

# 昇順ソート
a.sort!

# n = 5 固定なので
puts a[n / 2]

# 解答例1-2
a = $stdin.read.split.map(&:to_i)

# 昇順ソート
a.sort!
l = a.length

puts l.odd? ? a[l / 2] : (a[l / 2 - 1] + a[l / 2]) / 2.0
