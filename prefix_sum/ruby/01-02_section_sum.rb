# 区間の和 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step2

INPUT1 = <<"EOS"
1 2 3 4 5 6 7 8 9 10
EOS

OUTPUT1 = <<"EOS"
33
EOS

l = 2
r = 7

# 入力
a = gets.split.map(&:to_i)

# 累積和
s = [0]
a.each do |num|
  s << s[-1] + num
end

# 区間和を出力
section_sum = s[r + 1] - s[l]
puts section_sum
