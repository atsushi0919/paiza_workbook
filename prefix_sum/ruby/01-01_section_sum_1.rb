# 区間の和 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step1

a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]
l = 2
r = 7

# 累積和
n = a.length
s = Array.new(n + 1, 0)
0.upto(n - 1) do |i|
  s[i + 1] = s[i] + a[i]
end

# p s
# > [0, 1, 6, 15, 22, 27, 30, 32, 37, 45, 49]

# a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7]
r_sum = s[r + 1]

# a[0] + a[1]
l_sum = s[l]

#   a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7]
# - a[0] + a[1]
# _______________________________________________________
# =               a[2] + a[3] + a[4] + a[5] + a[6] + a[7]

# 区間和を出力
section_sum = r_sum - l_sum
puts section_sum
