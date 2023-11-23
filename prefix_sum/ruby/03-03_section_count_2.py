# 区間内の個数 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step3

INPUT1 = """\
2 7
1 2 3 4 5 6 7 8 9 10
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
1 6
3 6 9 8 8 4 1 2 3 5
"""
OUTPUT2 = """\
4
"""

# 入力
x, y, *a = map(int, open(0).read().split())

# 累積和 (偶数: 1, 奇数: 0)
s = [0]
for num in a:
    s.append(s[-1] + (1 if num % 2 == 0 else 0))

# 区間の偶数の数
even_count = s[y + 1] - s[x]
print(even_count)
