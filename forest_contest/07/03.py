# 気温 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__temparature

INPUT1 = "38"
OUTPUT1 = "extremely hot day"

INPUT2 = "32"
OUTPUT2 = "hot summer day"

INPUT3 = "-1"
OUTPUT3 = "ice day"

# # 解答例1-1
# x = int(input())

# if x >= 35:
#     res = "extremely hot day"
# elif x >= 30:
#     res = "hot summer day"
# elif x >= 25:
#     res = "summer day"
# elif x < 0:
#     res = "ice day"
# else:
#     res = "normal day"

# print(res)

# # 解答例1-2
# x = int(input())

# if x in range(35, 41):
#     res = "extremely hot day"
# elif x in range(30, 35):
#     res = "hot summer day"
# elif x in range(25, 30):
#     "summer day"
# elif x in range(-20, 0):
#     "ice day"
# else:
#     "normal day"

# print(res)

'''
最高気温が35度以上の日を猛暑日、30度以上の日を真夏日、25度以上の日を夏日、0度未満の日を真冬日といいます。
最高気温が与えられるので、どの日に当たるかを判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
x


・ 1 行目に、最高気温 x が入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
猛暑日なら、"extremely hot day"、真夏日なら、"hot summer day"、夏日なら、"summer day"、真冬日なら、"ice day"、
それ以外は"normal day"と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ -20 ≦ x ≦ 40

入力例1
38

出力例1
extremely hot day

入力例2
32

出力例2
hot summer day

入力例3
-1

出力例3
ice day
'''