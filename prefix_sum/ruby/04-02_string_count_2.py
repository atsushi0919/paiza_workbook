# 区間内の個数 (文字列) 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step2

INPUT1 = """\
bwwbwbbwbw
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
wbbbbbbbww
"""
OUTPUT2 = """\
6
"""

# 入力
l = 3
r = 8
str = input()

# 累積和 (b: 1, w: 0)
s = [0]
for c in list(str):
    s.append(s[-1] + (1 if c == "b" else 0))

# 区間の "b" の数
num_of_b = s[r] - s[l - 1]
print(num_of_b)
