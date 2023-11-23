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
    input_lines = input_str.split("\n")
    n, x, y = map(int, input_lines[0].split())
    a = list(map(int, input_lines[1].split()))

    # 累積和
    s = [0] * (n + 1)
    for i in range(n):
        s[i + 1] = s[i] + a[i]

    # a[x] から a[y] までの区間和を返す
    return s[y + 1] - s[x]


print(solve(open(0).read()))


'''
# 入力
n, x, y = map(int, input().split())
a = list(map(int, input().split()))

# 累積和
s = [0] * (n + 1)
for i in range(n):
    s[i + 1] = s[i] + a[i]

# 区間和を出力
section_sum = s[y + 1] - s[x]
print(section_sum)
'''
