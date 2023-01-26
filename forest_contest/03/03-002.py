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

'''
# 解答例1
# 入力
s = INPUT2

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

print(w)
'''

'''
# 解答例2
s1, s2 = input().split()

print(s1 + s2)

# 解答例3
print("".join(input().split()))
'''

'''
# 解答例4
print(INPUT2.replace(" ", ""))
'''

'''
=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
入力として、2つの文字列がスペース区切りで与えられます。

これらの文字列を連結し、1つの英単語にして出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

s1 s2

・s1, s2は文字列


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
s1とs2を連結し、出力してください。
（s1とs2は変更せずにそのまま連結してください）

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ (s1の長さ), (s2の長さ) ≤ 10

入力例1
play ing

出力例1
playing

入力例2
un balance

出力例2
unbalance
=end
'''