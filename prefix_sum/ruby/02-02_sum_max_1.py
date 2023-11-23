# 連続する N 個の和の最大値 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step2

INPUT1 = """\
1 2 3 4 5 6 7 8 9 10
"""
OUTPUT1 = """\
27
"""

INPUT2 = """\
8 1 3 1 3 8 3 1 8 8
"""
OUTPUT2 = """\
17
"""

# 入力
k = 3
a = list(map(int, input().split()))

# 累積和
s = [0]
for num in a:
    s.append(s[-1] + num)

# 連続する3個の最大和を調べる
max_sum = 0
for i in range(k, len(a) + 1):
    # 今までの最大和より大きければ更新
    section_sum = s[i] - s[i - k]
    max_sum = max([max_sum, section_sum])

# 連続する3個の最大和を出力
print(max_sum)
