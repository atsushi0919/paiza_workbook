# 連続する N 個の和の最大値 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step3

INPUT1 = """\
10
1 2 3 4 5 6 7 8 9 10
"""
OUTPUT1 = """\
27
"""

INPUT2 = """\
8
13 81 31 83 38 11 33 88
"""
OUTPUT2 = """\
195
"""

# 入力
k = 3
_, *a = list(map(int, open(0).read().split()))

# 累積和と最大区間和の更新
max_sum = 0
s = [0]
for i, num in enumerate(a):
    # 累積和更新
    s.append(s[-1] + num)
    # 3個目の要素からは区間和を調べる
    if i >= k - 1:
        # 区間和が最大なら更新
        max_sum = max([max_sum, s[-1] - s[i - (k - 1)]])

# 連続する3個の和の最大値を出力
print(max_sum)
