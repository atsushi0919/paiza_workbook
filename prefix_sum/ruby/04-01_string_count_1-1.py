# 区間内の個数 (文字列) 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step1

# 入力
l = 3
r = 8
str = "bwbwwbwbwb"

# b: 1, w: 0
b = []
for c in list(str):
    if c == "b":
        b.append(1)
    else:
        b.append(0)

# 累積和
s = [0]
for num in b:
    s.append(s[-1] + num)

# 区間の "b" の数
num_of_b = s[r] - s[l - 1]
print(num_of_b)
