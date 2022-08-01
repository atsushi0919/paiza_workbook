# 1 行目で与えられる N 個の実数の入力 (large) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_boss

# 解答例
# 入力
ary = [*map(float, input().split()[1:])]
# 出力
[print(f) for f in ary]
