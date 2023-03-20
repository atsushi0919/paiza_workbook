# 最大の差 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_largest_diff

INPUT1 = """\
35
48
51
67
72"""
OUTPUT1 = "37"

# 解答例1-1
n = 5
a = [int(input()) for _ in range(n)]

# 0 ≦ m_i ≦ 100
max_sc = -1
min_sc = 101
for sc in a:
    max_sc = max([max_sc, sc])
    min_sc = min([min_sc, sc])

print(max_sc - min_sc)

# 解答例1-2
a = list(map(int, open(0).read().strip().split()))

max_sc = max(a)
min_sc = min(a)

print(max_sc - min_sc)