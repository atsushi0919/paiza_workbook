# 【区間内の個数】区間内の個数 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_boss

INPUT1 = """\
10 2 7
1 2 3 4 5 6 7 8 9 10
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
8 1 3
1 3 8 3 1 8 8 1
"""
OUTPUT2 = """\
1
"""


def solve(input_str):
    # 入力
    _, x, y, *a = map(int, input_str.split())

    # 累積和 (偶数: 1, 奇数: 0)
    s = [0]
    for num in a:
        s.append(s[-1] + (1 if num % 2 == 0 else 0))

    # a[x] ~ a[y] 区間の偶数の数を返す
    return s[y + 1] - s[x]


print(solve(open(0).read()))
