# 2 行目で与えられる N 個の実数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_step2

# 解答例
# 1 行目入力
n = int(input())
# 2 行目入力
ary = [*map(float, input().split())]
# 出力
[print(f) for f in ary]
