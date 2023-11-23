# 区間内の個数 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step2

INPUT1 = <<"EOS"
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
1 4 7 8 9 6 3 1 5 8
EOS
OUTPUT2 = <<"EOS"
2
EOS

# 入力
l = 2
r = 7
a = gets.split.map(&:to_i)

# 偶数: 1, 奇数: 0
b = a.map { |num| num.even? ? 1 : 0 }

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の偶数の数
even_count = s[r + 1] - s[l]
puts even_count
