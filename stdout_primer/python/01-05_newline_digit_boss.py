#　【改行あり出力】1,000 行の出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__newline_digit_boss

# 解答例1
# 1 から 1000 までの配列 ary を作成
# ary = [1, 2, 3, ... 998, 999, 1000]
ary = list(range(1, 1001))
# 出力
[print(num) for num in ary]

# 解答例2
# 出力
for num in range(1, 1001):
    print(num)
