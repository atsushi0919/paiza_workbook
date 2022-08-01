# 1 行目で与えられる N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step3

# 解答例
# 入力
n, *ary = map(int, input().split())
# 出力
[print(num) for num in ary]
