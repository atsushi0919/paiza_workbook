# 区間内の個数 (文字列) 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step3

INPUT1 = <<"EOS"
3 8
bwwbwbbwbw
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
3 7
wbwbbbbwwb
EOS
OUTPUT2 = <<"EOS"
4
EOS

# 入力
x, y = gets.split.map(&:to_i)
str = gets.chomp

# b: 1, w: 0
b = str.chars.map { |c| c == "b" ? 1 : 0 }

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の "b" の数
num_of_b = s[y] - s[x - 1]
puts num_of_b
