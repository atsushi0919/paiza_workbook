# 最も大きな最大公約数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__max_gcd

INPUT1 = "6"
OUTPUT1 = "3"

INPUT2 = "17"
OUTPUT2 = "8"

# # 解答例1-1
# def get_gcd(a, b):
#     if a < b:
#         a, b = b, a 
#     t = a % b
#     while t != 0:
#         a = b
#         b = t
#         t = a % b
#     return b

# n = int(input())

# max_gcd = -1
# for a in range(1, n):
#     for b in range(a+1, n+1):
#         max_gcd = max([max_gcd, get_gcd(a, b)])

# print(max_gcd)

# # 解答例1-2
# import math
# import itertools

# n = int(input())

# max_gcd = -1
# for (a, b) in itertools.combinations(range(1, n+1), 2):
#     max_gcd = max([max_gcd, math.gcd(a, b)])

# print(max_gcd)

# 解答例2
print(int(input()) // 2)

'''
入力として自然数 n が与えられます。1 から n までの範囲にある全ての異なる整数の組のうち、最も大きな最大公約数を求めてください。
つまり、 1 ≦ a < b ≦ n を満たすようなすべての gcd(a, b) の中で最も大きな値を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n


・ 1 行目に、自然数 n が入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 から n までの範囲にある全ての異なる整数の組のうち、最も大きな最大公約数を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 100

入力例1
6

出力例1
3

入力例2
17

出力例2
8
'''
