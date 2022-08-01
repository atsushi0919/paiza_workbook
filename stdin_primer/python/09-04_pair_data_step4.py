# 文字列と整数の組の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step4

# 入出力例
INPUT1 = """
5
paiza 813
pa 81
8pa 13
iza 8
pa 13
"""
OUTPUT1 = """
paiza 813
pa 81
8pa 13
iza 8
pa 13
"""

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
pairs = []
for _ in range(n):
    s, a = input().split()
    pairs.append([s, int(a)])
# 出力
[print(*pair) for pair in pairs]

# 解答例2
# 1 行目入力
n = int(input())
# 続く n 行入力
pairs = [[*(lambda l: (l[0], int(l[1])))(input().split())] for _ in range(n)]
# 出力
[print(*pair) for pair in pairs]
