# 数値を異なる長さで 2 行出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step2

# 入出力例
# INPUT1 = <<~"EOS"
#   3 5
# EOS
# OUTPUT1 = <<~"EOS"
#   1 2 3
#   1 2 3 4 5
# EOS

# 解答例
# 入力
n, m = map(int, input().split())
# ary_n: 1 以上 n 以下の整数の配列
ary_n = list(range(1, n + 1))
# ary_m: 1 以上 m 以下の整数の配列
ary_m = list(range(1, m + 1))
# 出力
print(*ary_n)
print(*ary_m)
