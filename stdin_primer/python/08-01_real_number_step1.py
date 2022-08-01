# 改行区切りでの N 個の実数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_step1

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [float(input()) for _ in range(n)]
# 出力
[print(f) for f in ary]
