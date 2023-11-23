# 区間の和 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step3

# 入力
x, y, *a = $stdin.read.split.map(&:to_i)

# 累積和
s = [0]
a.each { |num| s << s[-1] + num }

# 区間和を出力
section_sum = s[y + 1] - s[x]
puts section_sum
