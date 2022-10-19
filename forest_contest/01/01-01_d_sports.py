# スポーツの人数 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_sports

INPUT1 = """\
baseball"""

OUTPUT1 = """\
9"""

# 解答例1
# 入力
s = input()

# 球技の人数を出力
if s == "baseball":
    print(9)
elif s == "soccer":
    print(11)
elif s == "rugby":
    print(15)
elif s == "basketball":
    print(5)
elif s == "volleyball":
    print(6)

# 解答例2
# 球技の人数
sports = { "baseball": 9,
           "soccer": 11,
           "rugby": 15,
           "basketball": 5,
           "volleyball": 6 }

# 入力
s = input()

# 球技の人数を出力
print(sports[s])