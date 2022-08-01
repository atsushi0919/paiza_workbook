# 3 行 3 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step1

# 入出力例
INPUT1 = """
8 1 3
1 2 3
3 1 8
"""
OUTPUT1 = """
8 1 3
1 2 3
3 1 8
"""

# 解答例
h = 3
# 入力
ary = [[*map(int, input().split())] for _ in range(h)]
# 出力
[print(*row) for row in ary]
