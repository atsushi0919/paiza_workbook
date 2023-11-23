# 二次元累積和 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_step1

# 入力
sy, sx = 1, 1
gy, gx = 3, 3
h, w = 5, 5
a = [
    [1, 2, 3, 4, 5],
    [2, 3, 4, 5, 6],
    [3, 4, 5, 6, 7],
    [4, 5, 6, 7, 8],
    [5, 6, 7, 8, 9],
]

# 累積和
s = [[0] * (w + 1) for _ in range(h + 1)]
for y in range(h):
    for x in range(w):
        s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]

# 長方形の区間和を出力
section_sum = s[gy + 1][gx + 1] - s[sy][gx + 1] - s[gy + 1][sx] + s[sy][sx]
print(section_sum)
