# 区間内の個数 (文字列) 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step3

INPUT1 = """\
3 8
bwwbwbbwbw
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
3 7
wbwbbbbwwb
"""
OUTPUT2 = """\
4
"""

# 入力
input_lines = open(0).read().split("\n")

print(input_lines)

x, y = map(int, input_lines[0].split())
str = input_lines[1]

# 累積和 (b: 1, w: 0)
s = [0]
for c in list(str):
    s.append(s[-1] + (1 if c == "b" else 0))

# 区間の "b" の数
num_of_b = s[y] - s[x - 1]
print(num_of_b)
