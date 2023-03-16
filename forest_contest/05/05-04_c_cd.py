# CD (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_cd

INPUT1 = """\
15
1 7
5 22
5 23
5 4
4 30
3 58
3 55
4 17
3 30
5 0
3 53
3 38
5 25
4 14
7 16
"""

OUTPUT1 = "Yes"

# 解答例1-1
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
n = int(input())

total_sec = 0
for _ in range(n):
    m, s = map(int, input().split())
    total_sec += 60 * m + s

print(total_sec)
if total_sec <= MAX_RECORDING_SEC:
    print("Yes")
else:
    print("No")

# 解答例1-2
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
_, *songs = [list(map(int, r.split())) for r in open(0).read().strip().split("\n")]

total_sec = sum([60 * m + s for (m, s) in songs])

print("Yes") if total_sec <= MAX_RECORDING_SEC else print("No")

# 解答例2
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
_, *songs = [list(map(int, r.split())) for r in open(0).read().strip().split("\n")]

m, s = [sum(x[i] for x in songs) for i in range(len(songs[0]))]
total_sec = 60 * m + s

print("Yes") if total_sec <= MAX_RECORDING_SEC else print("No")
