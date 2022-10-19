# エレベーターの行き先 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_elevator

INPUT1 = """\
1F 7F"""
OUTPUT1 = """\
up"""

INPUT2 = """\
5F 2F"""
OUTPUT2 = """\
down"""

'''
# 解答例1
# 入力
f1, f2 = map(lambda x: int(x[0]), input().split())

# f1 と f2 を比較して押すボタンを出力
if f1 < f2:
    print("up")
else:
    print("down")
'''

# 解答例2
# 入力
f1, f2 = input().split()

# f1 と f2 を比較して押すボタンを出力
if f1 < f2:
    print("up") 
else:
    print("down")
