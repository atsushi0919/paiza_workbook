# N 組の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step2

# 入出力例
INPUT1 = """5
813 813
 8 13
 81 1
 81 3
 8 813
"""
OUTPUT1 = """813 813
  8 13
  81 1
  81 3
  8 813
"""

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
pairs = [[*map(int, input().split())] for _ in range(n)]
# 出力
[print(*pair) for pair in pairs]
