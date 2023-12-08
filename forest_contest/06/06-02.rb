# 最大イニング (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_maxinning

INPUT1 = <<"EOS"
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
OUTPUT1 = <<"EOS"
Yes
EOS

INPUT2 = <<"EOS"
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
OUTPUT2 = <<"EOS"
6
EOS

INPUT3 = <<"EOS"
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
OUTPUT3 = <<"EOS"
7
EOS

k,*a=$<.map &:to_i;l=nil;n=0;(0..8).each{|i|n+=a[i];l=i+1 if n>k;break if l};puts l||"Yes"

=begin
# 解答例1-1
n = 9
k = gets.to_i
a = n.times.map { gets.to_i }

leaving_inning = nil  # 交代イニング
num_of_pitches = 0    # 現在の投球数
0.upto(n - 1) do |i|
  num_of_pitches += a[i]

  # k 球を超えた?
  if num_of_pitches > k
    leaving_inning = i + 1
    break
  end
end

if leaving_inning.nil?
  puts "Yes"
else
  puts leaving_inning
end

# 解答例1-2
k, *a = $stdin.read.split.map(&:to_i)

leaving_inning = nil  # 交代イニング
num_of_pitches = 0    # 現在の投球数
a.each.with_index(1) do |v, i|
  num_of_pitches += v

  # k 球を超えた?
  if num_of_pitches > k
    leaving_inning = i
    break
  end
end

puts leaving_inning || "Yes"
=end