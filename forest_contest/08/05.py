# 乗客人数 - その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_008/forest_contest_008__passenger2

INPUT1 = """\
4
0 2 1 8
6 3 2 0
"""
OUTPUT1 = """\
8
"""

INPUT2 = """\
4
0 1 5 3
3 4 2 0
"""
OUTPUT2 = """\
6
"""

# # 解答例1-1
# n = int(input())
# leave = list(map(int, input().split()))
# enter = list(map(int, input().split()))

# # 最大の乗客数、現在の乗客数を初期化
# max_p = 0
# now_p = 0
# # 各バス停での乗降数を調べる
# for i in range(n):
#     now_p = now_p - leave[i] + enter[i]
#     # 最大の乗客数を超えたら更新
#     max_p = max([max_p, now_p])

# print(max_p)


# 解答例1-2
# 1行で書く場合
# _, leave, enter = map(lambda x: list(map(int, x.split())), open(0).read().strip().split("\n"))

# 分けて書く場合（デバッグしやすい）
_, leave, enter = open(0).read().strip().split("\n")
leave = list(map(int, leave.split()))
enter = list(map(int, enter.split()))

# 最大の乗客数、現在の乗客数を初期化
max_p = now_p = 0
# 各バス停での乗降数を調べる
for l_i, e_i in zip(leave, enter):
    now_p = now_p - l_i + e_i
    # 最大の乗客数を超えたら更新
    max_p = max([max_p, now_p])

print(max_p)

'''
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
パイザ交通の運営するバスは n 個のバス停に順番に停まります。初めのバス停に着く前は乗客は誰もいません。
i 番目のバス停では a_i 人がバスから降り、b_i 人がバスに乗ります。
ここでバスを利用1する乗客全員がバスに乗ることができる範囲で最も少ない乗車定員のバスを用意したいです。
乗車定員の人数を求めてください。ただし、各バス停では降りる客が全員降りた後に、新しい客が乗ってくるものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 ... a_n
b_1 ... b_n


・ 1 行目に バス停の数 n が整数で与えられます。
・ 2 行目に i 番目のバス停で降りる人数 a_i がそれぞれ整数で半角スペース区切りで与えられます。
・ 3 行目に i 番目のバス停で新しく乗る人数 b_i がそれぞれ整数で半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
バスの乗車定員を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 1000
・ a_1 = 0
・ b_n = 0
・ 0 ≦ a_i ≦ min(1000,その時の乗車人数) (2 ≦ i ≦ n)
・ 0 ≦ b_i ≦ 1000 (1 ≦ i ≦ n - 1)

入力例1
4
0 2 1 8
6 3 2 0

出力例1
8

入力例2
4
0 1 5 3
3 4 2 0

出力例2
6
'''
