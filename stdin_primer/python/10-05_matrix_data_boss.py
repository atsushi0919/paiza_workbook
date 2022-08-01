# 【N 行 M 列のデータの入力】行ごとに要素数の異なる整数列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_boss

# 入出力例
INPUT1 = """
3
1 8
2 8 1
3 8 1 3
"""
OUTPUT1 = """
8
8 1
8 1 3
"""

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [[*map(int, input().split()[1:])] for _ in range(n)]
# 出力
[print(*row) for row in ary]
