# 自動車の燃費 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_car_fuel

INPUT1 = """\
65 600"""
OUTPUT1 = """\
9"""

INPUT2 = """\
36 831"""
OUTPUT2 = """\
23"""

# 解答例1
# 入力
v, d = map(int, input().split())

# 燃費を出力
print(d // v)

# 解答例2
# 入力
v, d = map(int, input().split())

# 燃費を出力
print(divmod(d, v)[0])
