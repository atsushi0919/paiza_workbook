# 【特定の文字で区切り 1 行で出力】大きな数値を 3 けたごとにカンマ区切りで出力 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_boss

# 解答例1
# 入力
n = int(input())
# n を文字列に変換して左右逆にする
r_s = str(n)[::-1]
# r_s 末尾のインデックス
e_i = len(r_s) - 1
# i=0 から e_i までカウントアップしながら繰り返す
s = ""
for i in range(e_i + 1):
    # r_s[i] を文字列 c_s に追加
    s += r_s[i]
    # 末尾以外かつ 3 の倍数のなら文字列 c_s にカンマ"," を追加
    if i != e_i and (i + 1) % 3 == 0:
        s += ","
# 左右反転させてカンマ付きの文字列を元に戻す
s = s[::-1]
# 出力
print(s)
