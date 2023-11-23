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
x, y = map(int, input().split())
str = input()

# b: 1, w: 0
b = [1 if c == "b" else 0 for c in list(str)]

# 累積和
s = [0]
for num in b:
    s.append(s[-1] + num)

# 区間の "b" の数
num_of_b = s[y] - s[x - 1]
print(num_of_b)
