# 3 * 3 の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step2

# 解答例1
w = 3
# 入力
ary = map(int, input().split())
# ary の先頭から順に参照する
row = []
for n in ary:
    # n を row に追加する
    row.append(n)
    # 要素数 w=3 個毎に row を出力し row を空にする
    if len(row) == w:
        print(*row)
        row = []

# 解答例2
w = 3
# 入力
ary = map(int, input().split())
# 3 x 3 の行列を作成
matrix = []
row = []
# ary の先頭から順に参照する
for n in ary:
    # n を row に追加する
    row.append(n)
    # 要素数 w=3 個毎に row を matrix に追加し row を空にする
    if len(row) == w:
        matrix.append(row)
        row = []
# 出力
[print(*row) for row in matrix]
