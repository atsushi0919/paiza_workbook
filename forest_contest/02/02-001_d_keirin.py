# 競輪のユニフォーム (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_keirin

INPUT1 = """\
2
"""
OUTPUT1 = """\
black
"""

INPUT2 = """\
5
"""
OUTPUT2 ="""\
yellow
"""

'''
# 解答例1
# 入力
n = int(input())

# n に対応した色を color に代入
color = ""
if n == 1:
    color = "white"
elif n == 2:
    color = "black"
elif n == 3:
    color = "red"
elif n == 4:
    color = "blue"
elif n == 5:
    color = "yellow"
elif n == 6:
    color = "green"
elif n == 7:
    color = "orange"
elif n == 8:
    color = "pink"
elif n == 9:
    color = "purple"

# color を出力
print(color)
'''

# 解答例2
# 色の設定
colors = ["white", "black", "red", "blue", "yellow", "green", "orange", "pink", "purple"]

# なるべく少ない入力で配列を作るなら
# split メソッド
# colors = "white black red blue yellow green orange pink purple".split()

# 入力
n = int(input())

# n に対応した色を出力
print(colors[n - 1])


'''
n が
1のとき、white
2のとき、black
3のとき、red
4のとき、blue
5のとき、yellow
6のとき、green
7のとき、orange
8のとき、pink
9のとき、purple
'''