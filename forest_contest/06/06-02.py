# 最大イニング (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_maxinning

INPUT1 = """\
99
6
16
14
22
8
11
7
10
4"""
OUTPUT1 = "Yes"

INPUT2 = """\
70
6
16
14
22
8
11
7
10
4"""

OUTPUT2 = "6"

INPUT3 = """\
77
6
16
14
22
8
11
7
10
4"""
OUTPUT3 = "7"

# 解答例1-1
n = 9
k = int(input())
a = [ int(input()) for _ in range(n)]

leaving_inning = None   # 交代イニング
num_of_pitches = 0      # 現在の投球数
for i in range(n):
    num_of_pitches += a[i]

    # k 球を超えた?
    if num_of_pitches > k:
        leaving_inning = i + 1
        break

if leaving_inning is None:
    print("Yes")
else:
    print(leaving_inning)

# 解答例1-2
k, *a = map(int, open(0).read().strip().split())

leaving_inning = None   # 交代イニング
num_of_pitches = 0      # 現在の投球数
for (i, v) in enumerate(a, 1):
    num_of_pitches += v

    # k 球を超えた?
    if num_of_pitches > k:
        leaving_inning = i
        break

print(leaving_inning or "Yes")