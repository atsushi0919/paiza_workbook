# 区間の和 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step2

l = 2
r = 7

# 入力
a = list(map(int, input().split()))

# 累積和
s = [0]
for num in a:
    s.append(s[-1] + num)

# 区間和を出力
section_sum = s[r + 1] - s[l]
print(section_sum)
