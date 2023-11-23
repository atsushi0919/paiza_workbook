# 【二次元累積和】 二次元累積和 7 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_boss2

INPUT1 = """\
5 5 3
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
4 5 6 7 8
5 6 7 8 9
1 1 3 3
2 2 4 4
0 0 2 2
"""
OUTPUT1 = """\
45
63
27
"""

INPUT2 = """\
8 3 1
8 1 3
1 3 8
3 1 8
8 1 3
1 3 8
3 1 8
8 1 3
1 3 8
0 0 7 2
"""
OUTPUT2 = """\
96
"""


def solve(input_str):
    # 入力
    input_lines = input_str.rstrip().split("\n")
    h, w, q = map(int, input_lines[0].split())
    a = []
    for l in input_lines[1:h+1]:
        a.append(list(map(int, l.split())))
    rects = []
    for l in input_lines[h+1:]:
        rects.append(list(map(int, l.split())))

    # 累積和
    s = [[0] * (w + 1) for _ in range(h + 1)]
    for y in range(h):
        for x in range(w):
            s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]

    # 長方形の区間和
    results = []
    for sy, sx, gy, gx in rects:
        results.append(s[gy + 1][gx + 1] - s[sy]
                       [gx + 1] - s[gy + 1][sx] + s[sy][sx])

    # 長方形の区間和を改行で連結した文字列を返す
    return "\n".join(map(str, results))


print(solve(open(0).read()))

'''
# 入力
h, w, q = map(int, input().split())
a = []
for _ in range(h):
    a.append(list(map(int, input().split())))
rects = []
for _ in range(q):
    rects.append(list(map(int, input().split())))

# 累積和
s = [[0] * (w + 1) for _ in range(h + 1)]
for y in range(h):
    for x in range(w):
        s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]

# 長方形の区間和を出力
for sy, sx, gy, gx in rects:
    section_sum = s[gy + 1][gx + 1] - s[sy][gx + 1] - s[gy + 1][sx] + s[sy][sx]
    print(section_sum)
'''
