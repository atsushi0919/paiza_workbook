# 区間内の個数 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step1

# 入力
l = 2
r = 7
a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

# 偶数: 1, 奇数: 0
b = [1 if num % 2 == 0 else 0 for num in a]
# b = list(map(lambda num: 1 if num % 2 == 0 else 0, a))

# 累積和
s = [0]
for num in b:
    s.append(s[-1] + num)

# 区間の偶数の数
even_count = s[r + 1] - s[l]
print(even_count)
