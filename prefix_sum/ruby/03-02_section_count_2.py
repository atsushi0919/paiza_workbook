# 区間内の個数 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step2

INPUT1 = """\
1 2 3 4 5 6 7 8 9 10
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
1 4 7 8 9 6 3 1 5 8
"""
OUTPUT2 = """\
2
"""

# 入力
l = 2
r = 7
a = list(map(int, input().split()))

# 累積和 (偶数: 1, 奇数: 0)
s = [0]
for num in a:
    s.append(s[-1] + (1 if num % 2 == 0 else 0))

# 区間の偶数の数
even_count = s[r + 1] - s[l]
print(even_count)
