# 文字列の逆順 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_reverse

INPUT1 = """\
paiza"""
OUTPUT1 = """\
aziap"""

INPUT2 = """\
apple"""
OUTPUT2 = """\
elppa"""

# ptyhon3 解答例1
# 入力
s = input()

# s の文字数 n を取得
n = len(s)

# 空文字列 r_s を用意
r_s = ""
# i を n-1 から 0 まで 1 ずつ減らしながら繰り返す
for i in range(n-1, -1, -1):
    # s[i] を r_s 末尾に追加
    r_s += s[i]

# 出力
print(r_s)

# python3 解答例2
print(input()[::-1])
