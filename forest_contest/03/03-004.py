# キーボードのシミュレーション (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__c_keyboard

# 入出力例
INPUT1 = """\
3
a
shift b
c"""
OUTPUT1 = """\
aBc"""

INPUT2 = """\
7
a
capslock
b
c
d
capslock
f"""
OUTPUT2 = """\
aBCDf"""

# python3 解答例
# 入力
n = int(input())
c = [input() for _ in range(n)]

display = ""
capslock = False
# n 行の入力で繰り返し処理
for row in c:
    keys = row.split()

    if keys[0] == "capslock":
        # capslock の ON/OFF 切り替え
        capslock = not capslock
    elif keys[0] == "shift":
        # shift と一緒に押されたキーの大文字を display に追加
        display += keys[1].upper()
    else:
        # capslock ON なら大文字, OFF なら小文字を display に追加
        display += keys[0].upper() if capslock else keys[0]

# 出力
print(display)
