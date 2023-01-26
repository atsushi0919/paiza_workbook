# 入出力例
INPUT1 = """\
4
333
222
444
666"""
OUTPUT1 = """\
333 444"""

INPUT2 = """\
4
111
222
333
444"""
OUTPUT2 = """\
multiple answers"""

INPUT3 = """\
4
800
125
310
602"""
OUTPUT3 = """\
no answer"""


BINGO = 777
_, *a = [int(x) for x in INPUT3.split()]

# BINGO 以下の数字だけ調べる
a = [x for x in a if x <= BINGO]
n = len(a)
# 数字の組み合わせ数
max_cnt = (1 << n)

win_comb = []
# i を 1 から max_cnt - 1 までカウントアップ
for i in range(1, max_cnt):
    # n 桁の 2 進数に変換
    bits = bin(i)[2:].zfill(n)

    # 数字の組み合わせを作る
    tmp_comb = []
    for j in range(n):
        if bits[j] == "0":
            continue
        tmp_comb.append(a[j])

    # 数字の合計が BINGO のとき
    if sum(tmp_comb) == BINGO:
        # win_comb に数字の組み合わせを追加
        win_comb.append(tmp_comb)
    # BINGO が複数ならループを抜ける
    if len(win_comb) > 1:
        break

if len(win_comb) == 0:
    # BINGO が作れない場合
    res = "no answer"
elif len(win_comb) == 1:
    # BINGO の組み合わせが 1 個
    res = " ".join(map(str, sorted(win_comb[0])))
else:
    # BINGO の組み合わせが 2 個以上
    res = "multiple answers"

print(res)

print(win_comb)

'''
=begin
ラッキーナンバー (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
与えられた数字を組み合わせて、ラッキーナンバー777を作ろうと考えました。

n個の自然数が与えられるので、足して777になる数字の組み合わせを見つけて、

それらの数字を小さい順に出力してください。

ただし、そのような組み合わせが複数ある場合には multiple answers
そのような組み合わせがない場合には no answer
を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます
n
x_1
x_2
...
x_n

・入力される自然数の数n
・x_1, x_2, ..., x_n は自然数
・入力はn + 1行となり、末尾に改行を一つ含みます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
足して777になる組み合わせがある場合には、その数字を昇順にスペース区切りで出力してください。

ただし、そのような組み合わせが
・複数ある場合には、multiple answers
・存在しない場合には、no answer
を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ n ≤ 8
1 ≤ x_1, x_2, ..., x_n ≤ 1000

入力例1
4
333
222
444
666

出力例1
333 444

入力例2
4
111
222
333
444

出力例2
multiple answers

入力例3
4
800
125
310
602

出力例3
no answer
=end
'''