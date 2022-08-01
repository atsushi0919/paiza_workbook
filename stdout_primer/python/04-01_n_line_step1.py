# 1 行または 2 行の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__n_line_step1

# 解答例1
# 入力
n = int(input())
# 1 から n までの配列 ary を生成
ary = list(range(1, n + 1))
# 出力
[print(n) for n in ary]

# 解答例2
# 入力
n = int(input())
# num を 1 から n まで 1 ずつ増やしながら繰り返す
for num in range(1, n + 1):
    print(num)

# 解答例3
# 入力 (1 ≦ n ≦ 2)
n = int(input())
# 出力
if n >= 1:
    print(1)
if n == 2:
    print(2)
