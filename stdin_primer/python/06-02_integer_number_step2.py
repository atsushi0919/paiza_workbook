# 2 行目で与えられる N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step2

# 解答例
# 1 行目の入力
n = int(input())
# 2 行目の入力
ary = [int(num) for num in input().split()]
# 出力
[print(num) for num in ary]
