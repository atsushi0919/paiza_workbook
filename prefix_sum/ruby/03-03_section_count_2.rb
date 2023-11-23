# 区間内の個数 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step3

INPUT1 = <<"EOS"
2 7
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
1 6
3 6 9 8 8 4 1 2 3 5
EOS
OUTPUT2 = <<"EOS"
4
EOS

# 入力
x, y, *a = $stdin.read.split.map(&:to_i)

# 累積和 (偶数: 1, 奇数: 0)
s = [0]
a.each { |num| s << s[-1] + (num.even? ? 1 : 0) }

# 区間の偶数の数
even_count = s[y + 1] - s[x]
puts even_count
