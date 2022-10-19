# 背番号順 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__c_player_number

INPUT1 = """\
3
83 PAIZA
11 SUZUKI
90 TANAKA"""
OUTPUT1 = """\
11 SUZUKI
83 PAIZA
90 TANAKA"""

INPUT2 = """\
5
31 SAITO
56 GORO
11 IIJIMA
70 NAKAMURA
1 HAJIME"""
OUTPUT2 = """\
1 HAJIME
11 IIJIMA
31 SAITO
56 GORO
70 NAKAMURA"""

# 解答例1
# 入力
n = int(input())
players = []
for _ in range(n):
    number, name = input().split()
    players.append([int(number), name])

# 背番号で昇順ソート
players.sort()
# これでも同じ
# players.sort(key=lambda x: x[0])

# 出力
for (number, name) in players:
    print(f"{number} {name}")

# 解答例2
# 入力
_, *players = open(0).read().strip().split("\n")

# 背番号で昇順ソート
players.sort(key=lambda x: int(x.split()[0]))
# 出力
print(*players, sep="\n")
