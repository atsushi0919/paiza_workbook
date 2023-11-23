# 区間の和 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step1

a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]
l = 2
r = 7

# 累積和
s = [0]
a.each do |num|
  s << s[-1] + num
end

# 区間和を出力
section_sum = s[r + 1] - s[l]
puts section_sum
