# N 行 3 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step2

# 入出力例
INPUT1 = """
2
1 2 3
8 1 3
"""
OUTPUT1 = """
1 2 3
8 1 3
"""

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [[*map(int, input().split())] for _ in range(n)]
# 出力
[print(*row) for row in ary]
