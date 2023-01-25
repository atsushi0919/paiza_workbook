# セール販売 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__c_sale

INPUT1 = """\
3
shirt 1000
shoes 2000
shirt 500
"""
OUTPUT1 = """\
3500
"""

INPUT2 = """\
4
shirt 500
pants 1000
pants 500
shoes 2000
"""
OUTPTU2 = """\
3500
"""

'''
# 解答例1
# 入力
# n = int(input())            # 1 行の入力を受け取って整数型に変換
# lines = []                  # 空のリストを用意
# for _ in range(n):
#     lines.append(input())   # n 行の入力を受け取って配列 list 末尾に追加

# 上記を短く書くと (n は不要になる)
_, *lines = open(0).read().strip().split("\n")

# 品物 item のリストと合計金額 total を記録する
items = []
total = 0
for line in lines:
    item, price = line.split()
    items.append(item)
    total += int(price)

# もし "pants" を購入かつ total が 2000 円以上なら 500 円引き
if "pants" in items and total >= 2000:
    total -= 500

print(total)
'''

# 解答例2
# 入力
_, *lines = open(0).read().strip().split("\n")

# 合計金額 total と "pants" を買ったかを記録する
pants = False
total = 0
for line in lines:
    item, price = line.split()
    if item == "pants":
        pants = True 
    total += int(price)

# もし pants を購入かつ total が 2000 円以上なら 500 円引き
if pants and total >= 2000:
    total -= 500

print(total)