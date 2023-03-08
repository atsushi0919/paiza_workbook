# サイクルヒット (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit

INPUT1 = """\
4
3
2
0
1
"""

OUTPUT1 = "Yes"


# # 解答例1-1
# n = 5

# single_hit = False
# two_base_hit = False
# three_base_hit = False
# home_run = False
# for _ in range(n):
#     m = int(input())
#     if m == 1:
#         single_hit = True
#     elif m == 2:
#         two_base_hit = True
#     elif m == 3:
#         three_base_hit = True
#     elif m == 4:
#         home_run = True

# if single_hit and two_base_hit and three_base_hit and home_run:
#     print("Yes")
# else:
#     print("No")

# # 解答例1-2
# m = list(map(int, open(0).read().strip().split()))

# # 0: 単打, 1: 二塁打, 2: 三塁打, 3: 本塁打
# ciclehit = [False] * 4
# for res in m:
#     if res > 0:
#         ciclehit[res - 1] = True

# print("Yes") if all(ciclehit) else print("No")

# # 解答例2
# m = open(0).read().strip().split()

# results = {}
# for res in m:
#     if res != "0":
#         results[res] = results.get(res, 0) + 1

# print("Yes") if len(results) == 4 else print("No")

# 解答例3
if len({res for res in open(0).read().strip().split() if res != "0"}) == 4:
    print("Yes")
else:
    print("No")

'''
サイクルヒット (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
野球のサイクルヒットとは、1 人のバッターが 1 試合の中で
単打（シングルヒット）、二塁打（ツーベース）、三塁打（スリーベース）、本塁打（ホームラン）全てを 1 本以上打った場合に成立する記録です。
パイザ君は 5 打席で、i (1 ≦ i ≦ 5)打席目の結果は m_i でした。
パイザ君がサイクルヒットを達成したかどうかを判定してください。打席の結果は単打が1、二塁打が2、三塁打が3、本塁打が4、
それ以外の結果は0と記録されます。

▼　下記解答欄にコードを記入してみよう

入力される値
m_1
m_2
...
m_5


・ 5 行のうち i (1 ≦ i ≦ n) 行目には、i 打席目の結果を表す整数 m_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
サイクルヒットの場合は「Yes」と出力してください。それ以外の場合は「No」と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 0 ≦ m_i ≦ 4

入力例1
4
3
2
0
1

出力例1
Yes
'''
