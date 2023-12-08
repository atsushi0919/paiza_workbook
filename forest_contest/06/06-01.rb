# 球数制限 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_balllimit

INPUT1 = <<"EOS"
5 100
12
14
20
8
17
EOS
OUTPUT1 = <<"EOS"
Yes
EOS

_,k,*a=$<.read.split.map &:to_i;puts a.sum<k ? "Yes" : "No"

=begin
# 解答例1-1
n, k = gets.split.map(&:to_i)
a = n.times.map { gets.to_i }

# 投球数の合計は k 球未満?
if a.sum < k
  puts "Yes"
else
  puts "No"
end

# 解答例1-2
_, k, *a = $stdin.read.split.map(&:to_i)

puts a.sum < k ? "Yes" : "No"
=end