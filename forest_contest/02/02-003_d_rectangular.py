# 長方形の面積 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_rectangular

INPUT1 = """\
7 5
"""
OUTPUT1 = """\
35
"""

INPUT2 = """\
0 10
"""
OUTPUT2 = """\
invalid
"""

'''
# 解答例1
# 入力
# input_strings = input().split()  # 文字列を半角スペースで分割して配列を生成
# e1 = int(input_strings[0])       # 1 番目の文字列を整数に変換
# e2 = int(input_strings[1])       # 2 番目の文字列を整数に変換

# ↓ 1 行で書くと

e1, e2 = map(int, input().split())

# 面積計算
s = e1 * e2

# 面積 s または invalid を出力
if s > 0:
    print(s)
else:
    print("invalid")
'''

'''
# 解答例2
import math

# 入力から面積を計算
s = math.prod(map(int, input().split()))

# 面積 s または invalid を出力
if s > 0:
    print(s)
else:
    print("invalid")
'''