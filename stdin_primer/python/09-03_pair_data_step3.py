# 整数の組からの選択 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step3

# 入出力例
INPUT1 = """
10
813 813
8 13
81 1
81 3
8 813
8 138
813 8
83 18
8 13
88 88
"""
OUTPUT1 = """
83 18
"""

# 解答例
t = 8
# 1 行目入力
n = int(input())
# 続く n 行入力
pairs = [[*map(int, input().split())] for _ in range(n)]
# t 個目の要素を参照
pair = pairs[t - 1]
# 出力
print(*pair)
