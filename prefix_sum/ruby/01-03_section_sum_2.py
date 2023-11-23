# 区間の和 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step3

INPUT1 = '''\
2 7
1 2 3 4 5 6 7 8 9 10
'''
OUTPUT1 = 33

INPUT2 = '''\
3 5
3 5 7 1 5 9 8 5 2 4
'''
OUTPUT2 = 15

# 入力
x, y, *a = map(int, open(0).read().split())


# 累積和
s = [0]
for num in a:
    s.append(s[-1] + num)

# 区間和を出力
section_sum = s[y + 1] - s[x]
print(section_sum)
