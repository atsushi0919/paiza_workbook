# 【区間の和】 区間の和 4 (paizaランク C 相当)
#  https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_boss

INPUT1 = """\
10 2 7
1 2 3 4 5 6 7 8 9 10
"""

OUTPUT1 = """\
33
"""

INPUT2 = """\
8 1 3
1 3 8 3 1 8 8 1
"""

OUTPUT2 = """\
14
"""


def solve(input_str):
    # 入力
    _, x, y, *a = map(int, input_str.split())

    # 累積和
    s = [0]
    for num in a:
        s.append(s[-1] + num)

    # a[x] から a[y] までの区間和を返す
    return s[y + 1] - s[x]


print(solve(open(0).read()))
