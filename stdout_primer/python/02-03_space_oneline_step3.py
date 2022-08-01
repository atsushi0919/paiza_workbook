# 10 個の数値を出力 (末尾に半角スペース有) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__space_oneline_step3

# 解答例1
# 1 から 10 までの配列 ary を作成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = list(range(1, 11))
# 出力 (末尾に半角スペース有)
print(" ".join(map(str, ary)) + " ")

# 解答例2
# 1 から 10 までの配列 ary を作成
ary = list(range(1, 11))
# 配列 ary の先頭から順に文字列に変換して半角スペースを追加して
# 文字列 s に追加する (末尾に半角スペース有)
s = ""
for num in ary:
    s += str(num) + " "
# 出力
print(s)
