# 英単語の生成（連結） (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_join

INPUT1 ="""\
play ing"""
OUTPUT1 ="""\
playing"""

INPUT2 = """\
un balance"""
OUTPUT2 = """\
unbalance"""

# python3 解答例1
# 入力
s = input()

# 空文字列 w を用意
w = ""
# s の文字数 n を取得
n = len(s)
# i を 0 から n-1 まで 1 ずつ増やしながら繰り返す
for i in range(n):
    # もし、s[i] が 半角スペース以外なら
    if s[i] != " ":
        # s[i] を w 末尾に追加
        w += s[i]

# 出力
print(w)
