# 【区間内の個数 (文字列) 】 区間内の個数 (文字列) 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_boss

INPUT1 = """\
10 3 8
bwwbwbbwbw
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
10 3 8
wbbwbbbwwb
"""
OUTPUT2 = """\
4
"""


def solve(input_str):
    # 入力
    input_lines = input_str.split("\n")
    _, x, y = map(int, input_lines[0].split())
    str = input_lines[1]

    # b: 1, w: 0
    b = [1 if c == "b" else 0 for c in list(str)]

    # 累積和
    s = [0]
    for num in b:
        s.append(s[-1] + num)

    # 区間の "b" の数
    return s[y] - s[x - 1]


print(solve(open(0).read()))
