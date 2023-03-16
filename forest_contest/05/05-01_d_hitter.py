# 3 割打者 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_hitter

INPUT1 = "10 3"

OUTPUT1 = "Yes"

# 解答例1-1
n, m = map(int, input().split())

if m / n >= 0.3:
    print("Yes")
else:
    print("No")


# 解答例1-2
n, m = map(int, input().split())

print("Yes") if m / n >= 0.3 else print("No")
