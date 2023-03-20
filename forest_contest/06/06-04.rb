# 最大の差 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_largest_diff

INPUT1 = <<"EOS"
35
48
51
67
72
EOS
OUTPUT1 = <<"EOS"
37
EOS

# 解答例1-1
n = 5
a = n.times.map { gets.to_i }

# 0 ≦ m_i ≦ 100
max_sc = -1
min_sc = 101
a.each do |sc|
  max_sc = [max_sc, sc].max
  min_sc = [min_sc, sc].min
end

puts max_sc - min_sc

# 解答例1-2
a = $stdin.read.split.map(&:to_i)

min_sc, max_sc = a.minmax

puts max_sc - min_sc
