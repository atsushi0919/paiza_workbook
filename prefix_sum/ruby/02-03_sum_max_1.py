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
input()
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