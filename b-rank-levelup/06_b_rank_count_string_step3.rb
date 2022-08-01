# １文字ずつ出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/count_string_2

<<"EOS"

入力例1
read

出力例1
r
e
a
d

入力例2
scale

出力例2
s
c
a
l
e

入力例3
representative

出力例3
r
e
p
r
e
s
e
n
t
a
t
i
v
e

EOS

# [解答例1]
#s = gets.chomp
#0.upto(s.length - 1) { |idx| puts idx }

# [解答例2]
#s = gets.chomp
#puts s.chars

# [解答例3]
#s = gets.chomp
#puts s.split("")

=begin
１文字ずつ出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/count_string_2
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
文字列が入力されるので、それらの文字を、1文字ずつ出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

s


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 s の各文字を、1文字ずつ出力してください。
1文字出力ごとに改行してください。

最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件を満たします。

1 ≦ (文字列 s の長さ) ≦ 30
s は半角英数字で構成された文字列

入力例1
read

出力例1
r
e
a
d

入力例2
scale

出力例2
s
c
a
l
e

入力例3
representative

出力例3
r
e
p
r
e
s
e
n
t
a
t
i
v
e
=end
