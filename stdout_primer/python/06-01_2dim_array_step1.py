# 2 * 2 の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step1

# 解答例1
ary = [[0, 8], [1, 3]]
# 出力
for row in ary:
    # 1 行毎に半角スペース区切りで出力する
    print(*row)

# 解答例2
ary = [[0, 8], [1, 3]]
# 出力
[print(*row) for row in ary]


# 解答例3
w = 2
ary = [0, 8, 1, 3]
# 出力
row = []
# ary の先頭から順に参照する
for n in ary:
    # n を row に追加する
    row.append(n)
    # 要素数 w=2 個毎に半角スペース区切りで出力する
    if len(row) == w:
        print(*row)
        row = []
