# 条件を満たす最小の整数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_mod_easy

INPUT1 = "11 7 2"

OUTPUT1 = "16"

# 解答例1-1
x, y, z = map(int, input().split())

while x % y != z:
    x += 1

print(x)

# 解答例1-2
x, y, z = map(int, input().split())

for _ in range(y-1):
    if x % y == z:
        break
    x += 1

print(x)

# 解答例2
x, y, z = gets.split.map(&:to_i)

puts x + (z - x % y) % y
