# 3 行 M 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step3

# 入出力例
INPUT1 = """
5
1 2 3 4 5
8 1 3 8 1
813 138 381 183 831
"""
OUTPUT1 = """
1 2 3 4 5
8 1 3 8 1
813 138 381 183 831
"""

# 解答例
n = 3
# 1 行目入力
m = int(input())
# 続く n 行入力
ary = [[*map(int, input().split())] for _ in range(n)]
# 出力
[print(*row) for row in ary]
