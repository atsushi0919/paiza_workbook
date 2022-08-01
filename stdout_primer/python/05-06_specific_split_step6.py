# 大きな数値を 3 けたごとにカンマ区切りで出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step6

# 解答例1
# 入力
n = int(input())
# n を文字列に変換する
s = str(n)
# s 末尾のインデックス
e_i = len(s) - 1
# i=0 から e_i までカウントアップしながら繰り返す
c_s = ""
for i in range(e_i + 1):
    # s[i] を文字列 c_s に追加
    c_s += s[i]
    # 末尾以外かつ 3 の倍数のなら文字列 c_s にカンマ"," を追加
    if i != e_i and (i + 1) % 3 == 0:
        c_s += ","
# 出力
print(c_s)
