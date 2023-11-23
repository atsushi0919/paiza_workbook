# 区間の和 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step3

# 入力
x, y = map(int, input().split())
a = list(map(int, input().split()))

# 累積和
s = [0]
for num in a:
    s.append(s[-1] + num)

# 区間和を出力
section_sum = s[y + 1] - s[x]
print(section_sum)
