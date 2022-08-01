# 【組になったデータの入力】文字列と整数の組からの選択 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_boss

# 入出力例
INPUT1 = """
10
paiza 813
pa 81
8pa 13
iza 8
pa 13
pai 3
zi 8
pp 33
pa 8
pa 138
"""
OUTPUT1 = """
pp 33
"""

# 解答例
t = 8
# 1 行目入力
n = int(input())
# 続く n 行入力
pairs = []
for _ in range(n):
    s, a = input().split()
    pairs.append([s, int(a)])
# t 個目の要素を参照
pair = pairs[t - 1]
# 出力
print(*pair)
