# 【整数の半角スペース区切りの入力】1,000個の整数の半角スペース区切りの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_boss

# 解答例
# 入力
ary = [*map(int, input().split())]
# 出力
[print(num) for num in ary]
