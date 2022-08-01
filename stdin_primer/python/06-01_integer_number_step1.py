# 改行区切りでの N 個の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step1

# 解答例
# 1 行目の入力
n = int(input())
# 続く n 行の入力
ary = [int(input()) for _ in range(n)]
# 出力
[print(num) for num in ary]
