# 中央値 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_median

INPUT1 = """\
92
35
61
81
65"""
EOS1 = "65"

# 解答例1-1
n = 5
a = [int(input()) for _ in range(n)]

# 昇順ソート
a.sort()

# n = 5 固定なので
print(a[n // 2])

# 解答例1-2
a = list(map(int, open(0).read().strip().split()))

# 昇順ソート
a.sort()
l = len(a)

print(a[l // 2] if l % 2 == 1 else (a[l // 2 - 1] + a[l // 2]) / 2)
