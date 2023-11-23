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
input_lines = $stdin.read.split("\n")
x, y = input_lines[0].split.map(&:to_i)
str = input_lines[1]

# 累積和 (b: 1, w: 0)
s = [0]
str.chars.each { |c| s << s[-1] + (c == "b" ? 1 : 0) }

# 区間の "b" の数
num_of_b = s[y] - s[x - 1]
puts num_of_b
