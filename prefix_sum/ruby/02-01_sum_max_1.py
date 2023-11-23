# 連続する N 個の和の最大値 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step1

# 入力
k = 3
a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

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
