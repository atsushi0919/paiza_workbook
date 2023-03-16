# テレワーク可能か (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_telework

INPUT1 = "60 sunny"

OUTPUT1 = "Yes"

# 解答例1-1
a, b = input().split()
a = int(a)

if a > 30 or b == "rainy":
    print("Yes")
else:
    print("No")


# 解答例1-2
a, b = input().split()

print("Yes") if int(a) > 30 or b == "rainy" else print("No")
