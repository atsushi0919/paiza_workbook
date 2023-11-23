# 区間内の個数 (文字列) 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step1

# 入力
l = 3
r = 8
str = "bwbwwbwbwb"

# 累積和 (b: 1, w: 0)
s = [0]
str.chars.each { |c| s << s[-1] + (c == "b" ? 1 : 0) }

# 区間の "b" の数
num_of_b = s[r] - s[l - 1]
puts num_of_b
