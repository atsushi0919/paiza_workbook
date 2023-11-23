# 区間内の個数 (文字列) 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step2

INPUT1 = <<"EOS"
bwwbwbbwbw
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
wbbbbbbbww
EOS
OUTPUT2 = <<"EOS"
6
EOS

# 入力
l = 3
r = 8
str = gets.chomp

# b: 1, w: 0
b = str.chars.map { |c| c == "b" ? 1 : 0 }

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の "b" の数
num_of_b = s[r] - s[l - 1]
puts num_of_b
