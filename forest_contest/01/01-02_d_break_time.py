# バイトの休憩時間 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_break_time

INPUT1 = """\
9"""
OUTPUT1 = """\
60 min"""

INPUT2 = """\
6"""
OUTPUT2 = """\
no break"""

# 解答例1
# 入力
h = int(input())

# 休憩時間を出力
if h > 8:
    print("60 min")
elif h > 6:
    print("45 min")
else:
    print("no break")

# 解答例2
# 入力
h = int(input())

# 休憩時間を計算
break_time = 0
if h > 8:
    break_time += 60
elif h > 6:
    break_time += 45

# 休憩時間を出力
if break_time == 0:
    print("no break")
else:
    print(f"{break_time} min")
