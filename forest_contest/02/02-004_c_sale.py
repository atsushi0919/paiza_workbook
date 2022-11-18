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
n = int(input())
shopping_list = []
for _ in range(n):
    item, price = input().split()
    shopping_list.append([item, int(price)])

# pants 購入チェックと合計金額計算
bought_pants = False
total = 0
for (item, price) in shopping_list:
    if item == "pants":
        bought_pants = True
    total += price

# 値引き処理
if bought_pants and total >= 2000:
    total -= 500

# 支払金額を出力
print(total)
'''

# 解答例2
def solve(input_str):
    # 入力
    input_lines = input_str.strip().split("\n")
    shopping_list = []
    for line in input_lines[1:]:
        item, price = line.split()
        shopping_list.append([item, int(price)])

    # 合計金額計算
    bought_pants = False
    total = 0
    for (item, price) in shopping_list:
        if item == "pants":
            bought_pants = True
        total += price
    
    # 値引き処理
    if bought_pants and total >= 2000:
        total -= 500

    # 確認用コード
    return total


print(solve(INPUT1))
# > ['3', 'shirt 1000', 'shoes 2000', 'shirt 500']
# > [['shirt', 1000], ['shoes', 2000], ['shirt', 500]]
# > [False, 3500]
# > 3500
print(solve(INPUT2))
# > ['4', 'shirt 500', 'pants 1000', 'pants 500', 'shoes 2000']
# > [['shirt', 500], ['pants', 1000], ['pants', 500], ['shoes', 2000]]
# > [True, 4000]
# > 3500
