# 球数制限 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_balllimit

INPUT1 = """\
5 100
12
14
20
8
17"""
OUTPUT1 = "Yes"

# 解答例1-1
n, k = map(int, input().split())
a = [int(input()) for _ in range(n)]

# 投球数の合計は k 球未満?
if sum(a) < k:
    print("Yes")
else:
    print("No")

# 解答例1-2
n, k, *a = map(int, open(0).read().strip().split())

print("Yes" if sum(a) < k else "No")
