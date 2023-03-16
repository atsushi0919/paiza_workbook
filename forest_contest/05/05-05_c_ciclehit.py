# サイクルヒット (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit

INPUT1 = """\
4
3
2
0
1
"""

OUTPUT1 = "Yes"


# 解答例1-1
n = 5

single_hit = False
two_base_hit = False
three_base_hit = False
home_run = False
for _ in range(n):
    m = int(input())
    if m == 1:
        single_hit = True
    elif m == 2:
        two_base_hit = True
    elif m == 3:
        three_base_hit = True
    elif m == 4:
        home_run = True

if single_hit and two_base_hit and three_base_hit and home_run:
    print("Yes")
else:
    print("No")

# 解答例1-2
m = list(map(int, open(0).read().strip().split()))

# 0: 単打, 1: 二塁打, 2: 三塁打, 3: 本塁打
ciclehit = [False] * 4
for res in m:
    if res > 0:
        ciclehit[res - 1] = True

print("Yes") if all(ciclehit) else print("No")

# 解答例2
m = open(0).read().strip().split()

results = {}
for res in m:
    if res != "0":
        results[res] = results.get(res, 0) + 1

print("Yes") if len(results) == 4 else print("No")

# 解答例3
if len({res for res in open(0).read().strip().split() if res != "0"}) == 4:
    print("Yes")
else:
    print("No")
