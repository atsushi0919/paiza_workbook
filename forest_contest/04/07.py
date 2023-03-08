# 解答例1-1
x = int(input())

if x >= 99:
    zoro = 99
elif x >= 88:
    zoro = 88
elif x >= 77:
    zoro = 77
elif x >= 66:
    zoro = 66
elif x >= 55:
    zoro = 55
elif x >= 44:
    zoro = 44
elif x >= 33:
    zoro = 33
elif x >= 22:
    zoro = 22
elif x >= 11:
    zoro = 11

print(zoro)

# 解答例1-2
x = int(input())

zoro = -1
for i in range(9, 0, -1):
    tmp_zoro = i * 11
    if x >= tmp_zoro:
        zoro = tmp_zoro
        break

print(zoro)

# 解答例2
x = input()

if x[0] <= x[1]:
    print(int(x[0]) * 11)
else:
    print((int(x[0]) - 1) * 11)


'''
ゾロ目 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__repdigit
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたは大豆を x (11 ≦ x ≦ 99) 粒持っています。

あなたは大豆とゾロ目が大好きなので、大豆をなるべくたくさん、ゾロ目の粒数だけ食べたいと思っています。何粒食べられるかを求めてください。

つまり、x 以下で最大のゾロ目を求めてください。ただし、ここでゾロ目とは同じ数字が 2 つ並んだもの (11、22、33、44、55、66、77、88、99)を指します。

▼　下記解答欄にコードを記入してみよう

入力される値
x

・ 1 行目に、あなたが持っている大豆の粒の数 x が整数で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
あなたが食べることのできる大豆の粒数を求め、1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 11 ≦ x ≦ 99

入力例1
60

出力例1
55
'''
