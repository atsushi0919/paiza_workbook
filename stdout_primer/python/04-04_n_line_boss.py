# 【n 行の出力】1,000 行以内の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__n_line_boss

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
# 1 から n まで 1 増やしながら繰り返す
for num in range(1, n + 1):
    print(num)
